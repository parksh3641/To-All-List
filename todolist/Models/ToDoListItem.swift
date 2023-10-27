//
//  ToDoListItem.swift
//  todolist
//
//  Created by 박성현 on 10/27/23.
//

import Foundation

struct ToDoListItem:Codable,Identifiable{
    let id:String
    let title:String
    let dueDate: TimeInterval
    let createdDate : TimeInterval
    var isDone:Bool
    
    mutating func setDone(_ state:Bool){
        isDone = state
    }
}
