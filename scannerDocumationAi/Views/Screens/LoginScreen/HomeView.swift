//
//  HomeView.swift
//  scannerDocumationAi
//
//  Created by hamid on 28.02.25.
//

import SwiftUI
import SwiftData
struct HomeView: View {
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
                
            }
        }
        
    }
    
    ///custom scaner button
    
}

#Preview {
    ContentView()
}
