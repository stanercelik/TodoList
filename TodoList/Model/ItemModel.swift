//
//  ItemModel.swift
//  TodoList
//
//  Created by Taner Çelik on 12.05.2023.
//

import Foundation

//Immutable Struct
struct ItemModel : Identifiable, Codable   {
    let id : String
    let title : String
    let isCompleted : Bool
    
    init(id: String = UUID().uuidString, title: String, isCompleted: Bool) {
        
        self.id = UUID().uuidString
        self.title = title
        self.isCompleted = isCompleted
    }
    
    // Bu fonksiyonu kullanarak variablelarımızı değişttirebiliyoruz
    func updateCompletion ()-> ItemModel {
        return ItemModel(id: id, title: title, isCompleted: !isCompleted)
    }
}

//ItemModel(title: <#T##String#>, isCompleted: <#T##Bool#>)
//ItemModel(id: , title: <#T##String#>, isCompleted: <#T##Bool#>)
