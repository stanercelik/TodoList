//
//  AddView.swift
//  TodoList
//
//  Created by Taner Çelik on 12.05.2023.
//

import SwiftUI

struct AddView: View {
    
    @State var textFieldText : String = ""
    
    var body: some View {
        ScrollView{
            VStack {
                 TextField("Type something here: ", text: self.$textFieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(#colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)))
                .cornerRadius(10)
                
                Button (action: {
                    print("za")
                },label: {
                    Text("SAVE")
                        .foregroundColor(Color.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(10)
                        
                    
                })

                
            }.padding(12)
                
        }
        .navigationTitle("Add an item 🖊️")
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            AddView(textFieldText: "")
        }
    }
}
