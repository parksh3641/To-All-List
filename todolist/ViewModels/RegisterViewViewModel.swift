//
//  RegisterViewViewModel.swift
//  todolist
//
//  Created by 박성현 on 10/27/23.
//
import FirebaseFirestore
import FirebaseAuth
import Foundation

class RegisterViewViewModel: ObservableObject{
    @Published var name = ""
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    init(){}
    
    func register(){
        guard validate()else{
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password){
            [weak self] result, error in guard let user = result?.user.uid else{
                return
            }
        }
    }
    
    private func insertUserRecord(id:String){
        let newUser = User(id: id, name: name, email: email, joined: Date().timeIntervalSince1970)
        
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(id)
            .setData(newUser.asDictionary())
    }
    
    private func validate() -> Bool {
        guard !name.trimmingCharacters(in: .whitespaces).isEmpty,
                !email.trimmingCharacters(in: .whitespaces).isEmpty,
                !password.trimmingCharacters(in: .whitespaces).isEmpty
                else
        {
            errorMessage = "이메일 또는 비밀번호를 입력하세요"
            return false
        }
        guard email.contains("@") && email.contains(".") else{
            errorMessage = "이메일 형식이 맞지 않습니다"
            return false
        }
        guard password.count >= 6 else{
            errorMessage = "비밀번호는 6글자 이상이어야 합니다"
            return false
        }
        return true
    }
}
