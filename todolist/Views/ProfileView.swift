//
//  ProfileView.swift
//  todolist
//
//  Created by 박성현 on 10/27/23.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var ViewModel = ProfileViewViewModel()
    
    var body: some View {
        NavigationView{
            VStack{
                Image(systemName: "person.circle")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                    .frame(width: 125,height: 125)
                    .padding()
                
                VStack(alignment: .leading){
                    HStack{
                        Text("이름 : ")
                        Text("123")
                            .bold()
                    }
                    .padding()
                    
                    HStack{
                        Text("이메일 : ")
                        Text("123")
                            .bold()
                    }
                    .padding()
                    
                    HStack{
                        Text("생성 날짜 : ")
                        Text("123")
                            .bold()
                    }
                    .padding()
                }
                .padding()
                
                Button("로그아웃"){
                    ViewModel.logout()
                }
                .tint(.red)
                .padding()
                
                Spacer()
            }
            .navigationTitle("프로필")
            
        }
        .onAppear{
            ViewModel.fetchUser()
        }
    }
    
}

#Preview {
    ProfileView()
}
