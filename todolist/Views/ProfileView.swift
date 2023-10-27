//
//  ProfileView.swift
//  todolist
//
//  Created by 박성현 on 10/27/23.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var ViewModel = ProfileViewViewModel()
    
    init(){}
    
    var body: some View {
        NavigationView{
            VStack{
                
            }
            .navigationTitle("프로필")
        }
    }
}

#Preview {
    ProfileView()
}
