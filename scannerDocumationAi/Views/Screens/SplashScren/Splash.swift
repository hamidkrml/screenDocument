//
//  Splash.swift
//  scannerDocumationAi
//
//  Created by hamid on 28.02.25.
//

import SwiftUI

struct Splash: View {
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.white) // Veya asset'te tanımlı özel bir renk
            Image("demo")
                // demo görseli, Assets.xcassets içinde tanımlı olmalı
        }
        .ignoresSafeArea()
    }
}
