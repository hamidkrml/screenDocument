//
//  Onbarding.swift
//  scannerDocumationAi
//
//  Created by hamid on 03.03.25.
//
import SwiftUI

struct IntroView : View {
    @AppStorage("showInter") private var showInter: Bool = true
    var body: some View {
        
        VStack(spacing: 15){
            
            Text("What's new in \nDocumant")
                .font(.title.bold())
                .multilineTextAlignment(.center)
                .padding(.top, 65)
                .padding(.bottom, 45)
            
            VStack(alignment: .leading, spacing: 25){
                PointView(
                    title: "scanDocumen",
                    image: "scanner",
                    decription: "scan any document withease"
                )
                PointView(
                    title: "scanDocumen",
                    image: "tray.full.fill",
                    decription: "scan any document withease"
                )
                PointView(
                    title: "scanDocumen",
                    image: "faceid",
                    decription: "scan any document witheasesadm asdma daslkmdal askdmakl"
                )
            }
            .padding(.horizontal,20)
            Spacer(minLength: 0)
            
            /// Cantiune button
            Button{
                showInter = false
            } label: {
                Text("Continue")
                    .font(.title3.bold())
                    .foregroundStyle(.white)
                    .hspacing(.center)
                    .padding(.vertical,12)
                    .background(.yellow.gradient,in: .capsule)
                
            }
            .padding(15)
        }
    }
    @ViewBuilder
    private func PointView(title:String,image:String,decription:String)-> some View{
        HStack(spacing:15){
            Image(systemName: image)
                .font(.largeTitle)
                .foregroundStyle(.yellow.opacity(0.7))
            
            VStack(alignment: .leading, spacing: 10){
                Text(title)
                    .font(.title3)
                    .fontWeight(.semibold)
                Text(decription)
                    .font(.callout)
                    .foregroundStyle(.gray)
                
                ///foregroundstyle (.gray)
            }
        }
    }
}





#Preview {
    IntroView()
}
