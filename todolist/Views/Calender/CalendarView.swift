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
    
    func updateUIView(_ uiView: UICalendarView, context: Context) {
        
    }
    
    Class Coordinator: NSObject, UICalendar
}
