//
//  TLButton.swift
//  todolist
//
//  Created by 박성현 on 10/27/23.
//

import SwiftUI

struct TLButton: View {
    let title:String
    let background : Color
    let action: () -> Void
    
    var body: some View {
        Button{
            action()
            
        } label: {
            ZStack{
                RoundedRectangle(cornerRadius: 30)
                    .foregroundColor(background)
                
                Text(title)
                    .foregroundColor(.white)
                    .bold()
            }
        }
        .controlSize(.regular)
    }
}

#Preview {
    TLButton(title: "로그인", background: .blue){
        
    }
}
