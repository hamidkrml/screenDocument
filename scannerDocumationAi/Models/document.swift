//
//  document.swift
//  scannerDocumationAi
//
//  Created by hamid on 03.03.25.
//
import SwiftUI
import SwiftData

@Model
class Document{
    var name: String
    var createdAt: Date = Date()
    
    @Relationship(deleteRule: .cascade, inverse: \documentPage.document)
    var pages: [documentPage]?
    var islocked: Bool = false
    ///for zom  Transition
    var uniqueViewid : String = UUID().uuidString
    
    init(name: String, pages: [documentPage]? = nil) {
        self.name = name
        self.pages = pages
    }
}
