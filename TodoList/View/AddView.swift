//
//  AddView.swift
//  TodoList
//
//  Created by Taner Çelik on 12.05.2023.
//

import SwiftUI

struct AddView: View {
    
    @State var textFieldText : String = ""
    @Environment(\.presentationMode ) var presentationMode
    @EnvironmentObject var listViewModel : ListViewModel
    
    @State var alertTitle : String = ""
    @State var showAlert : Bool = false
    
    var body: some View {
        ScrollView{
            VStack {
                 TextField("Type something here: ", text: self.$textFieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(#colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)))
                .cornerRadius(10)
                
                Button (action: saveButtonPressed,label: {
                    Text("SAVE")
                        .foregroundColor(Color.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                })
            }.padding(12)
                
        }
        .navigationTitle("Add an item 🖊️")
        .alert(isPresented: $showAlert) {
            getAlert()
        }
    }
    
    func saveButtonPressed(){

        if textIsAppropriate() {
            listViewModel.addItem(title: textFieldText)
            presentationMode.wrappedValue.dismiss()
            // View hiyerarşisinde geriye git.
            
        }
    }
    
    func textIsAppropriate() -> Bool {
        if textFieldText.count < 3 {
            alertTitle = "You new todo text is must be at 3 characters long! 🥲"
            showAlert.toggle()
            return false
        }
        return true
    }
    
    
    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            AddView(textFieldText: "")
        }
        .environmentObject(ListViewModel())
    }
}
