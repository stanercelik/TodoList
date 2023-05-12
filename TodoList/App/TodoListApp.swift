//
//  TodoListApp.swift
//  TodoList
//
//  Created by Taner Çelik on 12.05.2023.
//

import SwiftUI

@main
struct TodoListApp: App {
    var body: some Scene {
        
        // Bu değişince Viewın updatelenebilmesi için
        @StateObject  var listViewModel : ListViewModel = ListViewModel()
        
        
        WindowGroup {
            NavigationView{
                ListView()
            }
            .environmentObject(listViewModel) // Artık bütün viewlar listViewModel'i kullanabilir.
        }
    }
}
