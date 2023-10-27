//
//  RegisterView.swift
//  todolist
//
//  Created by 박성현 on 10/27/23.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var viewModel = RegisterViewViewModel()
 
    var body: some View {
        VStack{
            HeaderView(title: "계정 생성", subtitle: "할 일을 시작하세요", angle: -15, background: .orange)
            
            
            Form{
                TextField("이름",text:$viewModel.name)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                
                TextField("이메일",text:$viewModel.email)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                    .autocorrectionDisabled()
                
                SecureField("비밀번호",text:$viewModel.password)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                
                TLButton(title: "회원가입", background: .green
                ){
                    viewModel.register()
                }
                .padding()
            }
            .offset(y:-50)
            
            Spacer()
        }
    }
}

#Preview {
    RegisterView()
}
