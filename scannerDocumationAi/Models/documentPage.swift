//
//  documentPage.swift
//  scannerDocumationAi
//
//  Created by hamid on 03.03.25.
//

import Foundation
import SwiftData

@Model
class documentPage{
    var document: Document?
    var pageIndex: Int
    ///since it houre image data of  each document age 
    @Attribute(.externalStorage)
    var pageData: Data
    
    init(document: Document? = nil, pageIndex: Int, pageData: Data) {
        self.document = document
        self.pageIndex = pageIndex
        self.pageData = pageData
    }
}
