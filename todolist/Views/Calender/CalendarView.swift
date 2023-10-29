//
//  CakebdarView.swift
//  todolist
//
//  Created by 박성현 on 10/29/23.
//

import SwiftUI

@available(iOS 16.0, *)
struct CalendarView:UIViewRepresentable{
    let interval : DateInterval
    
    @ObservedObject var eventScore : EventStore
    
    func makeUIView(context:Context) -> UICalendarView {
        let view = UICalendarView()
        view.calendar = Calendar(identifier: .gregorian)
        view.availableDateRange = interval
        return view
    }
    
    func makeCoordinator() -> Coordinator{
        Coordinator(parent: self, eventStore: _eventStore)
    }
    
    
    func updateUIView(_ uiView: UICalendarView, context: Context) {
        
    }
    
    Class Coordinator: NSObject, UICalendarViewDelegate{
        var parent:CalendarView
        @ObservedObject var eventStore:EventStore
        init(interval: DateInterval, eventStore: ObservedObject<EventStore>) {
            self.interval = interval
            self.eventScore = eventScore
        }
        
        func calendarView(_ calendarView: UICalendarView,
                          decorationFor dateComponents: DateComponents) -> UICalendarView.Decoration?{
            return nil
        }
    }
}
