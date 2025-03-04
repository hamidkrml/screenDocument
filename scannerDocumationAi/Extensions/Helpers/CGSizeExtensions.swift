//
//  CGSizeExtensions.swift
//  scannerDocumationAi
//
//  Created by hamid on 04.03.25.
//
import SwiftUI

extension CGSize {
    
    func aspecFit(_ to: CGSize ) ->CGSize{
        let scalex = to.width / self.width
        let scaley = to.height / self.height
        
        
    let aspectRatio = min(scalex, scaley)
        return .init(width: aspectRatio * width, height: aspectRatio * height)
    }
}
