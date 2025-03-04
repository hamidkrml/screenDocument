//
//  HomeView.swift
//  scannerDocumationAi
//
//  Created by hamid on 28.02.25.
//

import SwiftUI
import SwiftData
import VisionKit
struct HomeView: View {
    @State private var showscanerView: Bool = false
    ///View properties
    @State private var documentName: String = "NewDocument"
    @State private var askDocumentName: Bool = false
    @State private var ScanerDocument: VNDocumentCameraScan?
    @State private var isLoading: Bool = false
    @Query(sort: [.init(\Document.createdAt,order: .reverse)],animation: .snappy(duration: 0.25,extraBounce: 0)) private var documents: [Document]
    
    ///envirmont  Values
    @Environment(\.modelContext) private var contex
    var body: some View {
      
        
        NavigationStack {
            ScrollView(.vertical){
                LazyVGrid(columns: Array(repeating: GridItem(spacing: 10), count: 2),spacing: 15) {
                    ForEach(documents) { document in
                        
                    }
                }
                .padding(15)
                
            }
            .navigationTitle("Document's")
            .safeAreaInset(edge: .bottom){
                createScanerButton()
            }
        }
        .fullScreenCover(isPresented: $showscanerView){
            ScannerView{ error in 
                
            }didcancel: {
                showscanerView = false
            } didfinsh: { scan in
                print(scan.pageCount)
                showscanerView = false
                askDocumentName = true
            }.ignoresSafeArea()
        }
        .alert("DocumentKey", isPresented: $askDocumentName) {
            TextField("NewDocument",text: $documentName)
            Button("save"){
                creAteButton()
            }.disabled(documentName.isEmpty)
        }
        .loadingscreen(status: $isLoading)
    }
    
    ///custom scaner button
    @ViewBuilder
    private func createScanerButton() -> some View {
        Button{
            showscanerView.toggle()
        } label: {
            HStack(spacing: 6){
                Image(systemName: "document.viewfinder.fill")
                    .font(.title)
           
                Text("Scan Document")
                    
            }
            .foregroundStyle(.white.opacity(0.7))
            .fontWeight(.semibold)
            .padding(.horizontal,15)
            .padding(.vertical,10)
            .background(.yellow,in:.capsule)
        }
        .hspacing(.center)
        .padding(.vertical,10)
        
        .background{
            Rectangle()
                .fill(.linearGradient(colors: [
                    .white.opacity(0),
                    .white.opacity(8),
                    .white,
                    .white
                    
                ], startPoint: .top, endPoint: .bottom))
            
        }
        .ignoresSafeArea()
    }
    
    private func creAteButton(){
        
        guard let ScanerDocument else {return}
        isLoading = true
        Task.detached(priority: .high) { [documentName] in
            ///swift 6 error------------------------->
            
            let document = Document(name: documentName)
            var pages: [documentPage] = []
            for pageIndex in 0..<ScanerDocument.pageCount {
                let pageImage = ScanerDocument.imageOfPage(at: pageIndex)
                ///converting Image into data
                ///Modifly the compreession as per your need
                ///
                
                guard let pageData = pageImage.jpegData(compressionQuality: 0.65) else{return}
                let documentPage = documentPage(document:document,pageIndex: pageIndex,pageData: pageData)
                pages.append(documentPage)
            }
            document.pages = pages
            await MainActor.run{
                contex.insert(document)
                try? contex.save()
                
                /// Resetting data
                self.ScanerDocument = nil
                isLoading = false
                self.documentName = "New Document "
            }
        }
    }
}

#Preview {
    ContentView()
}
