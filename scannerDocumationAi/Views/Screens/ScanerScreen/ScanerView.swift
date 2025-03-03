//
//  ScanerView.swift
//  scannerDocumationAi
//
//  Created by hamid on 03.03.25.
//
import SwiftUI
import VisionKit
/// SwiftUI içerisinde VisionKit'in belge tarayıcı arayüzünü kullanabilmek için oluşturulmuş yapı.
/// Bu yapı, UIViewControllerRepresentable protokolünü uygulayarak UIKit tabanlı VNDocumentCameraViewController'ı SwiftUI'ya entegre eder.
/// Tarama işlemi sırasında oluşan olaylar (başarılı tarama, iptal, hata) ilgili callback'ler üzerinden SwiftUI'ya iletilir.
struct ScannerView: UIViewControllerRepresentable {
    /// Tarama işlemi sırasında bir hata oluştuğunda çalıştırılacak callback.
    var didFinshWithError: (Error) -> ()
    /// Kullanıcı tarama işlemini iptal ettiğinde çalıştırılacak callback.

    var didcancel: () -> ()
    /// Tarama işlemi başarılı tamamlandığında taranan belgeyi içeren callback.

    var didfinsh: (VNDocumentCameraScan) -> ()
    
    /// Coordinator'ı oluşturur. Coordinator, UIKit view controller'ı ile SwiftUI arasında köprü görevi görür.

    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
        
    }
    
       /// SwiftUI view oluşturulduğunda kullanılacak VNDocumentCameraViewController'ı döndürür.
       /// - Parameter context: UIViewControllerRepresentable'ın context bilgisi.
       /// - Returns: VisionKit'in belge tarayıcı view controller'ı.
    func makeUIViewController(context: Context) -> VNDocumentCameraViewController {
        let contreler = VNDocumentCameraViewController()
        // Tarama olaylarını yakalayabilmek için delegate olarak Coordinator'ı atıyoruz.

        contreler.delegate = context.coordinator
        return contreler
    }
        /// SwiftUI view güncellendiğinde çağrılır. Bu örnekte herhangi bir güncelleme yapılmamaktadır.
        /// - Parameters:
        ///   - uiViewController: Güncellenecek view controller.
        ///   - context: UIViewControllerRepresentable'ın context bilgisi.
    func updateUIViewController(_ uiViewController: VNDocumentCameraViewController, context: Context) {
        
    }
        /// UIKit ile SwiftUI arasında köprü oluşturan Coordinator sınıfı.
        /// Belge tarayıcıdaki olayları delegate metodları üzerinden alır ve SwiftUI tarafındaki callback'lere iletir.
    class Coordinator: NSObject, VNDocumentCameraViewControllerDelegate {
        /// Coordinator oluşturulurken ScannerView instance'ı referansı alınır.
                /// - Parameter parent: ScannerView instance'ı.
        var parent: ScannerView
        /// ScannerView instance'ı referansı.
        init(parent: ScannerView) {
            self.parent = parent
        }
        /// Tarama işlemi başarıyla tamamlandığında çağrılır.
                /// - Parameters:
                ///   - controller: VNDocumentCameraViewController instance'ı.
                ///   - scan: Taranan belgeyi içeren VNDocumentCameraScan.
        func documentCameraViewController(_ controller: VNDocumentCameraViewController, didFinishWith scan: VNDocumentCameraScan) {
            parent.didfinsh(scan)
        }
        /// Kullanıcı tarama işlemini iptal ettiğinde çağrılır.
                /// - Parameter controller: VNDocumentCameraViewController instance'ı.
        func documentCameraViewControllerDidCancel(_ controller: VNDocumentCameraViewController) {
            parent.didcancel()
        }
        /// Tarama işlemi sırasında bir hata oluştuğunda çağrılır.
                /// - Parameters:
                ///   - controller: VNDocumentCameraViewController instance'ı.
                ///   - error: Oluşan hata.
        func documentCameraViewController(_ controller: VNDocumentCameraViewController, didFailWithError error: any Error) {
            parent.didFinshWithError(error)
        }
    }
}
