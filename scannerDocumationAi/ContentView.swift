////
////  ContentView.swift
////  scannerDocumationAi
////
////  Created by hamid on 25.02.25.
////
//
//import SwiftUI
//
//struct ContentView: View {
//    var body: some View {
//        VStack {
//            Image(systemName: "globe")
//                .imageScale(.large)
//                .foregroundStyle(.tint)
//            Text("Hello, world!")
//        }
//        .padding()
//    }
//}
//
//#Preview {
//    ContentView()
//}
//
//struct SplashScreen: View {
//    
//    @State private var isActive: Bool = true
//    var body: some View {
//        ZStack {
//            if isActive {
//                Splash()
//                    .transition(customsplashScreen(isRoot: false))
//            } else {
//                ContentView()
//                    .transition(customsplashScreen(isRoot: true))
//            }
//        }
//        .frame(maxWidth: .infinity, maxHeight: .infinity)
//        .background(.white)
//        .ignoresSafeArea()
//        .task {
//            guard isActive else { return }
//            try? await Task.sleep(for: .seconds(0.9))
//            
//            withAnimation(.smooth(duration: 0.56)) {
//                isActive = false
//                
//            }
//        }
//    }
//        var safeArea: UIEdgeInsets{
//               if let safeArea = (UIApplication.shared.connectedScenes.first as? UIWindowScene)?.keyWindow?.safeAreaInsets{
//                   return safeArea
//               }
//               return .zero
//           }
//    }
//    
//   
//    
//    
//    struct customsplashScreen: Transition {
//           var isRoot:Bool
//           func body(content: Content, phase: TransitionPhase) -> some View {
//               content
//                   .offset(y: phase.isIdentity ? 0 : isRoot ? scrensize.height: -scrensize.height)
//           }
//           var scrensize : CGSize{
//               if let screenSize = (UIApplication.shared.connectedScenes.first as? UIWindowScene)?.screen.bounds.size{
//                   return screenSize
//               }
//               return .zero
//           }
//       }
//   
//
//struct Splash: View {
//    var body: some View {
//        ZStack {
//        
//            Rectangle()
//                .fill(.whitee)
//                
//            Image("demo")
//                
//               
//        }
//        
//        .ignoresSafeArea()
//    }
//}
