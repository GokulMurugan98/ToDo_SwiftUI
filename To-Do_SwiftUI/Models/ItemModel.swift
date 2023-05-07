//
//  ItemModel.swift
//  To-Do_SwiftUI
//
//  Created by Gokul Murugan on 2023-05-06.
//

import Foundation

struct ItemModel: Identifiable, Codable{
    
    let title:String
    let isDone:Bool
    let id:String
    
    init(title: String, isDone: Bool, id: String = UUID().uuidString) {
        self.title = title
        self.isDone = isDone
        self.id = id
    }
    
    func updateComponent()-> ItemModel{
        return ItemModel(title: title, isDone: !isDone,id: id)
    }
    
    
}
