//
//  ListRowView.swift
//  To-Do_SwiftUI
//
//  Created by Gokul Murugan on 2023-05-06.
//

import SwiftUI

struct ListRowView: View {
    
    var item:ItemModel
    var body: some View {
        HStack(spacing: 20){
            Image(systemName: item.isDone ? "checkmark.circle" : "circle")
                .foregroundColor(item.isDone ? .green : .red)
            
            Text(item.title)
            Spacer()
        }.font(.title2)
            .padding(.horizontal,20)
            .padding(.vertical,10)
    }
}

struct ListRowView_Previews: PreviewProvider {
    static let item = ItemModel(title: "Item 1", isDone: true)
    
    static var previews: some View {
            ListRowView(item:item)
    }
}
