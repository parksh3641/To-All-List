//
//  LoginView.swift
//  todolist
//
//  Created by 박성현 on 10/27/23.
//

import SwiftUI


struct LoginView: View {
    
    @StateObject var viewModel = LoginViewViewModel()
    
    var body: some View {
        NavigationView{
            VStack{
                HeaderView(title: "할 일 목록", subtitle: "무엇이든 적어보세요", angle: 15, background: .pink)
                
                Form{
                    if !viewModel.errorMessage.isEmpty{
                        Text(viewModel.errorMessage)
                            .foregroundColor(.red)
                    }
                    
                    TextField("이메일",text : $viewModel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocapitalization(.none)
                        .autocorrectionDisabled()
                    
                    TextField("비밀번호",text : $viewModel.password)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocorrectionDisabled()
                    
                    TLButton(title: "로그인", background: .blue
                    ){
                        viewModel.login()
                    }
                    .padding()
                
                }
                .offset(y:-100)
                
                // Create Account
                VStack{
                    Text("새로운 계정이 필요하세요?")
                    NavigationLink("새로운 계정 생성",
                                   destination:RegisterView())
                }
                .padding(.bottom, 50)
                
                Spacer()
            }
        }
    }
}

#Preview {
    LoginView()
}
