//
//  StartTabView.swift
//  todolist
//
//  Created by 박성현 on 10/29/23.
//

import SwiftUI

struct StartTabView: View {
    @EnvironmentObject var myEvents: EventStore
    var body: some View {
        TabView{
            EventsListView()
                .tabItem {
                    Label("목록", systemImage: "list.triangle")
                }
            EventsCalendarView()
                .tabItem {
                    Label("달력", systemImage: "calendar")
                    
                }
        }
    }
}

#Preview {
    StartTabView()
        .environmentObject(EventStore(preview: true))
}
