//
//  EventsCalendarView.swift
//  todolist
//
//  Created by 박성현 on 10/29/23.
//

import SwiftUI

struct EventsCalendarView: View {
    var body: some View {
        NavigationView{
            ScrollView{
                
                CalendarView(interval: DateInterval(start: .distantPast, end: .distantFuture),
                             eventStore:eventStore)
            }
                .navigationTitle("캘린더")
        }
    }
}

#Preview {
    EventsCalendarView()
}
