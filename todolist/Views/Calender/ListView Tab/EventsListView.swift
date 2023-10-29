//
//  SwiftUIView.swift
//  todolist
//
//  Created by 박성현 on 10/29/23.
//

import SwiftUI

struct EventsListView: View {
    @EnvironmentObject var myEvents: EventStore
    @State private var formType: EventFormType?
    var body: some View {
        NavigationStack {
            List {
                ForEach(myEvents.events.sorted {$0.date < $1.date }) { event in
                    ListViewRow(event: event, formType: $formType)
                    .swipeActions {
                        Button(role: .destructive) {
                            myEvents.delete(event)
                        } label: {
                            Image(systemName: "trash")
                        }
                    }
                }
            }
            .navigationTitle("Calendar Events")
            .sheet(item: $formType) { $0 }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        formType = .new
                    } label: {
                        Image(systemName: "plus.circle.fill")
                            .imageScale(.medium)
                    }
                }
            }
        }
    }
}
#Preview {
    EventsListView()
        .environmentObject(EventStore(preview: true))
}
