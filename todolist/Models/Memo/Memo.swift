//
//  Memo.swift
//  todolist
//
//  Created by 박성현 on 10/28/23.
//

import Foundation

class Memo : Identifiable,ObservableObject{
    let id : UUID
    @Published var content:String
    let insertDate: Date
    
    init(content:String, insertDate:Date = Date.now){
        id = UUID()
        self.content = content
        self.insertDate = insertDate
    }
}
