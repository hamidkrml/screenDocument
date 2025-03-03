//
//  ViewExtensions.swift
//  scannerDocumationAi
//
//  Created by hamid on 02.03.25.
//

import SwiftUI

extension View{
    
    @ViewBuilder
    func hspacing(_ aligment: Alignment) -> some View{
        self
            .frame(maxWidth: .infinity, alignment: aligment)
    }
    @ViewBuilder
    func vspacing(_ aligment: Alignment) -> some View{
        self
            .frame(maxHeight: .infinity, alignment: aligment)
    }
    @ViewBuilder
    func loadingscreen(status:Binding<Bool>) -> some View{
        self
        .overlay{
            ZStack{
                Rectangle()
                    .fill(.ultraThinMaterial)
                    .ignoresSafeArea()
                ProgressView()
                    .frame(width: 40,height: 40)
                    .background(.bar, in: .rect(cornerRadius: 10))
            }
            .opacity(status.wrappedValue ? 1:0)
            .allowsHitTesting(status.wrappedValue)
            .animation(snapy,value: status.wrappedValue)
        }
    }
    var snapy: Animation{
        .snappy(duration: 0.25,extraBounce: 0)
    }
}
