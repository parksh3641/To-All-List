//
//  DateExtensions.swift
//  todolist
//
//  Created by 박성현 on 10/28/23.
//

import SwiftUI

extension Date{
    func format(_ format : String) -> String{
        let formatter = DateFormatter()
        formatter.dateFormat = format
        
        return formatter.string(from: self)
    }
    
    struct WeekDay: Identifiable{
        var id: UUID = .init()
        var date:Date
    }
    
    
    func fetchWeek(_ date:Date = .init()) -> [WeekDay]{
        let calender = Calendar.current
        let startDate = calender.startOfDay(for: date)
        
        var week:[WeekDay] = []
        let weekDate = calender.dateInterval(of: .weekOfMonth, for: startDate)
        guard let startWeek = weekDate?.start else{
            return []
        }
        
        (0..<7).forEach{index in
            if let weekDay = calender.date(byAdding: .day, value:index,to:startDate){
                week.append(.init(date:weekDay))
            }
        }
        return week
    }
}
