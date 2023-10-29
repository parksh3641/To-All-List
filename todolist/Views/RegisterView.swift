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
        NavigationView{
            VStack{
                HeaderView(title: "계정 생성", subtitle: "준비되셨나요?", angle: 0, background: .orange)
                
                
                VStack{
                    if !viewModel.errorMessage.isEmpty{
                        Text(viewModel.errorMessage)
                            .foregroundColor(.red)
                            .padding(.horizontal,10)
                    }
                    
                    TextField("이름",text:$viewModel.name)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .autocorrectionDisabled()
                        .padding(.horizontal,10)
                    
                    TextField("이메일",text:$viewModel.email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                        .autocorrectionDisabled()
                        .padding(.horizontal,10)
                    
                    SecureField("비밀번호",text:$viewModel.password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal,10)
                    
                    
                    TLButton(title: "회원가입", background: .green
                    ){
                        viewModel.register()
                    }
                    .padding(.horizontal,10)
                    .frame(height: 50.0)
                    
                    Spacer()
                }
                .offset(y:-200)
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

#Preview {
    RegisterView()
}
