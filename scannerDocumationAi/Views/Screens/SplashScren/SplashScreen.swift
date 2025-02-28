//
//  Untitled.swift
//  scannerDocumationAi
//
//  Created by hamid on 28.02.25.
//

import SwiftUI

struct SplashScreen: View {
    @StateObject private var viewModel = SplashScreenViewModel()
    
    var body: some View {
        ZStack {
            if viewModel.isActive {
                Splash()
                    .transition(CustomSplashTransition(isRoot: false))
            } else {
                ContentView()
                    .transition(CustomSplashTransition(isRoot: true))
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.white)
        .ignoresSafeArea()
    }
}

struct CustomSplashTransition: Transition {
    var isRoot: Bool
    
    func body(content: Content, phase: TransitionPhase) -> some View {
        content
            .offset(y: phase.isIdentity ? 0 : isRoot ? screenSize.height : -screenSize.height)
    }
    
    var screenSize: CGSize {
        if let screenSize = (UIApplication.shared.connectedScenes.first as? UIWindowScene)?.screen.bounds.size {
            return screenSize
        }
        return .zero
    }
}
