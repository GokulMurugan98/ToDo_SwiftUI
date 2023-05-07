//
//  AddItem.swift
//  To-Do_SwiftUI
//
//  Created by Gokul Murugan on 2023-05-06.
//

import SwiftUI

struct AddItem: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    @EnvironmentObject var listviewmodel:ListViewModel
    
    @State var textFieldText = ""
    @State var alertText = ""
    @State var showAlert = false
    
    
    var body: some View {
        ScrollView{
            VStack{
                TextField("Type a task to add...", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(maxWidth: .infinity)
                    .frame(height: 60)
                    .background(Color(.gray).opacity(0.2))
                    .cornerRadius(10)
                Button {
                    saveButton()
                } label: {
                    Text("Save")
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 60)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
            }.padding(10)
        }.navigationTitle("Add a task")
            .alert(isPresented: $showAlert, content: getAlert)
    }
    
    func saveButton(){
        
        if textIsValid(){
            listviewmodel.addItems(title: textFieldText)
            presentationMode.wrappedValue.dismiss()
        }
        
    }
    
    func textIsValid() -> Bool{
        if  textFieldText.count < 3{
            alertText = "Please enter a proper task"
            showAlert.toggle()
            return false
        } else{
            return true
        }
        
    }
    
    func getAlert() -> Alert{
        return Alert(title: Text(alertText))
    }
}

struct AddItem_Previews: PreviewProvider {
    static var previews: some View {
        AddItem()
    }
}
