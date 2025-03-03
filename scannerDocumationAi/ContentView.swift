////
////  ContentView.swift
////  scannerDocumationAi
////
////  Created by hamid on 25.02.25.
////

import SwiftUI

struct ContentView: View {
    @AppStorage("showInter") private var showInter: Bool = true

    var body: some View {
        HomeView()
            .sheet(isPresented: $showInter) {
                IntroView()
                .interactiveDismissDisabled()
            }
        
    }
}

