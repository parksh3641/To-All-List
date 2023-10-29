//
//  Event.swift
//  todolist
//
//  Created by 박성현 on 10/29/23.
//

import Foundation

struct Event: Identifiable {
    enum EventType: String, Identifiable, CaseIterable {
        case 일, 집, 모임, 스포츠, 미지정
        var id: String {
            self.rawValue
        }

        var icon: String {
            switch self {
            case .일:
                return "🏦"
            case .집:
                return "🏡"
            case .모임:
                return "🎉"
            case .스포츠:
                return "🏟"
            case .미지정:
                return "📌"
            }
        }
    }

    var eventType: EventType
    var date: Date
    var note: String
    var id: String
    
    var dateComponents: DateComponents {
        var dateComponents = Calendar.current.dateComponents(
            [.month,
             .day,
             .year,
             .hour,
             .minute],
            from: date)
        dateComponents.timeZone = TimeZone.current
        dateComponents.calendar = Calendar(identifier: .gregorian)
        return dateComponents
    }

    init(id: String = UUID().uuidString, eventType: EventType = .미지정, date: Date, note: String) {
        self.eventType = eventType
        self.date = date
        self.note = note
        self.id = id
    }

    // Data to be used in the preview
    static var sampleEvents: [Event] {
        return [
            Event(eventType: .집, date: Date().diff(numDays: 0), note: "애견 미용실 가기"),
            Event(date: Date().diff(numDays: -1), note: "에밀리에게 줄 선물 사기"),
            Event(eventType: .집, date: Date().diff(numDays: 6), note: "세금 신고서 제출"),
            Event(eventType: .모임, date: Date().diff(numDays: 2), note: "친구 집에서 저녁 파티"),
            Event(eventType: .일, date: Date().diff(numDays: -1), note: "장보기"),
            Event(eventType: .스포츠, date: Date().diff(numDays: -3), note: "풋볼 시합"),
            Event(date: Date().diff(numDays: -4), note: "겨울 방학 계획 세우기")
        ]
    }
}
