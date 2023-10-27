//
//  ContentView.swift
//  todolist
//
//  Created by 박성현 on 10/27/23.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewViewModel()
    
    var body: some View {
        if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty{
            accountView
        } else{
            LoginView()
        }
        
    }
    
    @ViewBuilder
    var accountView : some View{
        TabView{
            ToDoListView(userId: viewModel.currentUserId)
                .tabItem{
                    Label("홈",systemImage: "house")
                }
            ProfileView()
                .tabItem{
                    Label("프로필",systemImage: "person.circle")
                }
        }
    }
}

#Preview {
    MainView()
}
