//
//  ContentView.swift
//  todolist
//
//  Created by 박성현 on 10/27/23.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewViewModel()
    
    @StateObject var store = MemoStore()
    
    @StateObject var myEvents = EventStore(preview:true)
    
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
                    Label("할 일",systemImage: "square.and.pencil")
                }
            MemoView()
                .environmentObject(store)
                .tabItem{
                    Label("메모",systemImage: "note.text")
                }
            
            StartTabView()
                .environmentObject(myEvents)
                .tabItem{
                    Label("계획",systemImage: "calendar.badge.checkmark.rtl")
                }
            StopWatchView()
                .tabItem{
                    Label("타이머",systemImage: "timer.circle")
                }
            
            ProfileView()
                .tabItem{
                    Label("설정",systemImage: "gear")
                }
        }
    }
}
    
    
    #Preview {
        MainView()
    }
