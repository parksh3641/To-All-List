//
//  ToDoListitemView.swift
//  todolist
//
//  Created by 박성현 on 10/27/23.
//

import SwiftUI

struct ToDoListitemView: View {
    @StateObject var viewModel = ProfileViewViewModel()
    
    let item:ToDoListItem
    
    var body: some View {
        HStack{
            VStack(alignment : .leading){
                Text(item.title)
                    .font(.title)
                
                Text("\(Date(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated, time: .shortened))")
                    .font(.footnote)
                    .foregroundColor(Color(.secondaryLabel))
            }
            
            Spacer()
            
            Button{
                viewModel.toggleIsDone(item: item)
            } label: {
                Image(systemName: item.isDone ? "checkmark.circle.fill":"circle")
            }
        }
    }
}

#Preview {
    ToDoListitemView(item: .init(id: "123", title: "Get Milk", dueDate: Date().timeIntervalSince1970, createdDate: Date().timeIntervalSince1970, isDone: true))
}
