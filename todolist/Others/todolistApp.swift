//
//  todolistApp.swift
//  todolist
//
//  Created by 박성현 on 10/27/23.
//

import SwiftUI
import FirebaseCore

@main
struct todolistApp: App {
    
    init(){
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
