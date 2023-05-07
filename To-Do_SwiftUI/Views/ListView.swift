//
//  ListView.swift
//  To-Do_SwiftUI
//
//  Created by Gokul Murugan on 2023-05-06.
//

import SwiftUI

struct ListView: View {
    @EnvironmentObject var listviewmodel:ListViewModel
    
    var body: some View {
        ZStack{
            if listviewmodel.items.isEmpty{
                EmptyView()
            } else{
                List{
                    ForEach(listviewmodel.items){ item in
                        ListRowView(item: item)
                            .onTapGesture {
                                withAnimation(.linear){
                                    listviewmodel.updateItem(item: item)
                                }
                            }
                        
                    }.onDelete(perform: listviewmodel.deleteItem)
                        .onMove(perform: listviewmodel.moveItem)
                }
            }
        } .navigationTitle("To-do List")
            .navigationBarItems(leading: EditButton(), trailing: NavigationLink("Add",destination: AddItem()))
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        
        NavigationView{
            ListView()
        }.environmentObject(ListViewModel())
        
    }
}
