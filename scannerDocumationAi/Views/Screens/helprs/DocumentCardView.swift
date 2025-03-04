//
//  DocumentCardView.swift
//  scannerDocumationAi
//
//  Created by hamid on 04.03.25.
//

import SwiftUI


struct DocumentCardView: View {
    var document : Document
    ///for zoom Transition
    var animationID: Namespace.ID
    /// view properties
    @State private var downsizedImage:UIImage?
    var body: some View {
        VStack(alignment: .leading, spacing: 10){
            if let firstpage = document.pages?.sorted(by: { $0.pageIndex < $1.pageIndex }).first{
                GeometryReader{
                    let size = $0.size
                    if let downsizedImage{
                        
                    }else{
                        Rectangle()
                            .foregroundStyle(.clear)
                            .task(priority: .high) {
                                ///downsizing image
                                guard let image = UIImage(data: firstpage.pageData) else{ return } 
                            }
                    }
                }
            }
        }
    }
}
