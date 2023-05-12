//
//  ListViewModel.swift
//  TodoList
//
//  Created by Taner Çelik on 12.05.2023.
//

import Foundation
 
class ListViewModel : ObservableObject { // Viewların observelayabilmesi için 
    
    @Published var items : [ItemModel] = [] { // items'da bir değişiklik olduğunda
        didSet {
            saveItem()
        }
    }
    let itemsKey : String = "item_list"
    
    init() {
        getItems()
    }
    
    func getItems(){
        
        // GUARD LET
        // When you use guard you have a much higher expectancy for the guard to succeed and it's somewhat important that if it doesn't succeed,
        // then you just want to exit scope early.
        // Like you guard to see if a file/image exists, if an array isEmpty or not.
        
        guard
            let data =  UserDefaults.standard.data(forKey: itemsKey),
            let savedItems = try? JSONDecoder().decode([ItemModel].self, from: data)  // JSONData'yı decode ederek ItemModel yaptık
        else {
            return
        }
        
        self.items = savedItems
        
        // İkisini ayrı ayrı yazmaktansa üstteki gibi birleştirebiliriz
//        guard let data =  UserDefaults.standard.data(forKey: itemsKey) else { return }
//        guard let savedItems = try? JSONDecoder().decode([ItemModel].self, from: data ) else { return }
    }
    
    func deleteItem(indexSet : IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    
    func moveItem(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func addItem(title : String){
        let newItem = ItemModel(title: title, isCompleted: false)
        items.append(newItem)
    }
    
    func updateItem(item : ItemModel){
//       if let index = items.firstIndex { existingItem in
//            return existingItem.id == item.id
//       } {
//
//       }
    
        if let index = items.firstIndex(where: {$0.id == item.id}) {
            items[index] = item.updateCompletion()
        }
    }
    
    func saveItem(){
        if let encodedData = try? JSONEncoder().encode(items) {
            // ItemModel'i encode ederek JSON Data yaptık çünkü UserDefault'ta ItemModel diye bi type yok
            UserDefaults.standard.set(encodedData, forKey: itemsKey)
        }
    }
}
 
