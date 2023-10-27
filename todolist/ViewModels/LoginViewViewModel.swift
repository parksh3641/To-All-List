//
//  LoginViewViewModel.swift
//  todolist
//
//  Created by 박성현 on 10/27/23.
//

import Foundation
import FirebaseAuth

class LoginViewViewModel : ObservableObject{
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    init(){}
    
    func login(){
        guard validate() else{
            return
        }
        
        Auth.auth().signIn(withEmail: email, password: password)
        
        
    }
    
    func validate() -> Bool {
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else
        {
            errorMessage = "이메일 또는 비밀번호를 입력하세요"
            return false;
        }
        
        guard email.contains("@") && email.contains(".") else{
            errorMessage = "이메일 형식이 맞지 않습니다"
            return false;
        }
        
        return true
    }
}
