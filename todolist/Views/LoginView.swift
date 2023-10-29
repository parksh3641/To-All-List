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
                HeaderView(title: "To Do All List", subtitle: "일상을 기록하세요", angle: 0, background: .pink)
                
                VStack{
                    if !viewModel.errorMessage.isEmpty{
                        Text(viewModel.errorMessage)
                            .foregroundColor(.red)
                            .padding(.horizontal,10)
                    }
                    
                    TextField("이메일",text : $viewModel.email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .autocapitalization(.none)
                        .autocorrectionDisabled()
                        .padding(.horizontal,10)
                    
                    TextField("비밀번호",text : $viewModel.password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .autocorrectionDisabled()
                        .padding(.horizontal,10)
                    
                    
                    TLButton(title: "로그인", background: .blue
                    ){
                        viewModel.login()
                    }
                    .padding(.horizontal,10)
                    .frame(height: 50.0)
                    
                    TLButton(title: "애플 로그인", background: .black
                    ){
                        viewModel.appleLogin()
                    }
                    .padding(.horizontal,10)
                    .frame(height: 50.0)
                    
                    
                    Spacer()
                    
                    Text("새로운 계정이 필요하세요?")
                    NavigationLink("새로운 계정 생성",
                                   destination:RegisterView())
                    
                    Spacer()
                }
                .offset(y:-200)
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

#Preview {
    LoginView()
}
