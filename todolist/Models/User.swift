//
//  User.swift
//  todolist
//
//  Created by 박성현 on 10/27/23.
//

import Foundation

struct User : Codable{
    let id:String
    let name:String
    let email:String
    let joined:TimeInterval
}
