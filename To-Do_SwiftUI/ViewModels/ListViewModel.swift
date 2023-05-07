//
//  ListViewModel.swift
//  To-Do_SwiftUI
//
//  Created by Gokul Murugan on 2023-05-06.
//

import Foundation

class ListViewModel: ObservableObject{
    
    
    @Published var items:[ItemModel] = [] {
        didSet{
            saveItem()
        }
    }
    let itemKey:String = "Item_Key"
    init(){
        getItems()
    }
    
    func addItems(title:String){
        let newItem = ItemModel(title: title, isDone: false)
        items.append(newItem)
    }
    
    func updateItem(item:ItemModel){
        if let index = items.firstIndex(where: { $0.id == item.id }){
            items[index] = item.updateComponent()
        }
    }
    
    func deleteItem(indexSet:IndexSet){
        items.remove(atOffsets: indexSet)
    }
    
    func moveItem(from: IndexSet, to: Int){
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func saveItem(){
        if let encodedData = try? JSONEncoder().encode(items){
            
            UserDefaults.standard.set(encodedData, forKey: itemKey)
        }
    }
    
    func getItems(){
        
        guard let data = UserDefaults.standard.data(forKey: itemKey) else { return }
        
        
        if let decodedData = try? JSONDecoder().decode([ItemModel].self, from: data) {
            items = decodedData
            
        }
        
    }
    
    
}
