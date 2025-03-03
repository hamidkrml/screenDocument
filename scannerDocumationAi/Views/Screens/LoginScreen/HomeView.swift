//
//  HomeView.swift
//  scannerDocumationAi
//
//  Created by hamid on 28.02.25.
//

import SwiftUI
import SwiftData
struct HomeView: View {
    @State private var showscanerView: Bool = false
    ///View properties
    @Query(sort: [.init(\Document.createdAt,order: .reverse)],animation: .snappy(duration: 0.25,extraBounce: 0)) private var documents: [Document]
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
            
        }
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
}

#Preview {
    ContentView()
}
