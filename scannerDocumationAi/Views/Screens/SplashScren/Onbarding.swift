//
//  Onbarding.swift
//  scannerDocumationAi
//
//  Created by hamid on 03.03.25.
//
import SwiftUI

struct IntroView : View {
    var body: some View {
        
        VStack(spacing: 15){
            
            Text("What's new in \nDocumant")
                .font(.title3.bold())
                .multilineTextAlignment(.center)
                .padding(.top, 65)
                .padding(.bottom, 45)
            
            VStack(alignment: .leading, spacing: 25){
                
            }
        }
    }
    @ViewBuilder
    private func PointView(title:String,image:String)-> some View{
        HStack(spacing:15){
            Image(systemName: image)
                .font(.largeTitle)
                .foregroundStyle(.yellow.opacity(0.7))
        }
    }
}





#Preview {
    IntroView()
}
