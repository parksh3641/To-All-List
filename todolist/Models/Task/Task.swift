//
//  Task.swift
//  todolist
//
//  Created by 박성현 on 10/28/23.
//

import Foundation
import SwiftUI

struct Task:Identifiable{
    var id: UUID = .init()
    var title: String
    var caption: String
    var date: Date = .init()
    var isCompleted = false
    var tint: Color
}

var sampleTask:[Task] = [
    .init(title: "Standup", caption: "Every day metting",date:Date.now, tint:.yellow)
]


extension Date{
    static func updateHour(_ value: Int) -> Date{
        let calender = Calendar.current
        return calender.date(byAdding: .hour, value: value,to: .init()) ?? .init()
    }
}
