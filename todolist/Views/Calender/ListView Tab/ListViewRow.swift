//
//  ListViewRow.swift
//  todolist
//
//  Created by 박성현 on 10/29/23.
//

import SwiftUI

struct ListViewRow: View {
    let event: Event
    @Binding var formType: EventFormType?
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                HStack {
                    Text(event.eventType.icon)
                        .font(.system(size: 40))
                    Text(event.note)
                }
                Text(
                    event.date.formatted(date: .abbreviated,
                                         time: .shortened)
                )
            }
            Spacer()
            Button {
                formType = .update(event)
            } label: {
                Text("수정")
            }
            .buttonStyle(.bordered)
        }
    }
}

#Preview {
    ListViewRow(event: Event(eventType: .모임, date: Date(), note: "파티 참여"), formType: .constant(.new))
}
