//
//  ListRowView.swift
//  TodoList
//
//  Created by Taner Çelik on 12.05.2023.
//

import SwiftUI

struct ListRowView : View {
    
//    let title : String
    let item : ItemModel
    
    var body: some View {
        HStack{
            Image(systemName: item.isCompleted ?  "checkmark.circle" : "circle")
                .foregroundColor(item.isCompleted ? Color.green : .red)
            Text(item.title)
            Spacer()
            
        }.font(.title2)
            .padding(.vertical, 10)
    }
} 
 
struct ListRowView_Previews: PreviewProvider {
    
    static var item1 = ItemModel(title: "This is a completed title", isCompleted: true)
    static var item2 = ItemModel(title: "This is NOT a completed title", isCompleted: false)
    
    static var previews: some View {
        Group{
            ListRowView(item: item1)
            ListRowView(item: item2)
        }
        .previewLayout(.sizeThatFits)
    }
}
