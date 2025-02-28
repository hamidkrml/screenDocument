//
//  Untitled.swift
//  scannerDocumationAi
//
//  Created by hamid on 28.02.25.
//

import SwiftUI

class SplashScreenViewModel: ObservableObject {
    @Published var isActive: Bool = true
    
    init() {
        startSplashTimer()
    }
    
    func startSplashTimer() {
        Task {
            // 0.9 saniye bekledikten sonra splash ekranını kapatıyoruz.
            try? await Task.sleep(for: .seconds(0.9))
            await MainActor.run {
                withAnimation(.easeOut(duration: 0.56)) {
                    self.isActive = false
                }
            }
        }
    }
}
