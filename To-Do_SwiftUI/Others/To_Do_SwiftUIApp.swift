//
//  To_Do_SwiftUIApp.swift
//  To-Do_SwiftUI
//
//  Created by Gokul Murugan on 2023-05-05.
//

import SwiftUI

@main
struct To_Do_SwiftUIApp: App {
    
    @StateObject var listViewModel:ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ListView()
            }.environmentObject(listViewModel)
        }
    }
}
