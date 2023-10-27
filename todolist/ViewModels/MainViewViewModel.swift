//
//  MainViewViewModel.swift
//  todolist
//
//  Created by 박성현 on 10/27/23.
//

import FirebaseAuth
import Foundation

class MainViewViewModel:ObservableObject{
    @Published var currentUserId:String = ""
    private var handler : AuthStateDidChangeListenerHandle?
    
    init(){
        let handler = Auth.auth().addStateDidChangeListener{[weak self] _, user in
            DispatchQueue.main.async{
                self?.currentUserId = user?.uid ?? ""
            }
        }
    }
    
    public var isSignedIn:Bool{
        return Auth.auth().currentUser != nil
    }
}
