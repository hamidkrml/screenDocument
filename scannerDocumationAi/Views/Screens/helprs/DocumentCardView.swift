//
//  DocumentCardView.swift
//  scannerDocumationAi
//
//  Created by hamid on 04.03.25.
//

import SwiftUI


struct DocumentCardView: View {
    var document : Document
    ///for zoom Transition
    var animationID: Namespace.ID
    /// view properties
    @State private var downsizedImage:UIImage?
    var body: some View {
        VStack(alignment: .leading, spacing: 10){
            if let firstpage = document.pages?.sorted(by: { $0.pageIndex < $1.pageIndex }).first{
                GeometryReader{
                    let size = $0.size
                    if let downsizedImage{
                        Image(uiImage: downsizedImage)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: size.width,height: size.height)
                    }else{
                        Rectangle()
                            .foregroundStyle(.clear)
                            .task(priority: .high) {
                                ///downsizing image
                                guard let image = UIImage(data: firstpage.pageData) else{ return }
                                let aspectSize = image.size.aspecFit(.init(width: 150, height: 150))
                                let renderer = UIGraphicsImageRenderer(size: aspectSize)
                                let resizedImage = renderer.image { context in
                                    image.draw(in:.init(origin: .zero, size: aspectSize))
                                }
                                await MainActor.run{
                                    downsizedImage = resizedImage
                                }
                            }
                    }
                }
                .frame(height: 150)
                .clipShape(.rect(cornerRadius: 15))
            }
            Text(document.name)
                .font(.callout)
                .lineLimit(1)
                .padding(.top,15)
            Text(document.createdAt.formatted(date: .numeric,time: .omitted))
                .font(.caption2)
                .foregroundStyle(.gray)
        }
    }
}
