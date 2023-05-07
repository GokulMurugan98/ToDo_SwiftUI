//
//  EmptyItemsView.swift
//  To-Do_SwiftUI
//
//  Created by Gokul Murugan on 2023-05-06.
//

import SwiftUI

struct EmptyItemsView: View {
    @State var animate = false

    var body: some View {
        ScrollView{
            VStack{
                Text("No Tasks to show")
                    .font(.system(size: 30))
                    .fontWeight(.bold)
                    .padding(.bottom, 40)
                NavigationLink(destination: AddItem(), label: {
                    Text("Click here to add some tasks")
                        .foregroundColor(.black)
                        .frame(height: 50)
                        .frame(maxWidth: .infinity)
                        .background(animate ? Color("myColor") : Color.accentColor)
                        .cornerRadius(10)
    
                }).padding(.horizontal, animate ? 30 : 50)
                    .shadow(color: .gray,radius: 10 ,x: 5, y: 5)
                
                
                
            }.multilineTextAlignment(.center)
                .padding(30)
                .onAppear(perform: animation)
        }.frame(maxWidth: .infinity,maxHeight: .infinity)
    }
    
    func animation(){
        
        guard !animate else{return}
        DispatchQueue.main.asyncAfter(deadline: .now() + 2){
            withAnimation(.easeInOut(duration: 2.0)
                    .repeatForever()
            ){
                animate.toggle()
            }
        }
    }
    
}

struct EmptyItemsView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyItemsView()
    }
}
