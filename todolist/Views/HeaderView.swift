//
//  HeaderView.swift
//  todolist
//
//  Created by 박성현 on 10/27/23.
//

import SwiftUI

struct HeaderView: View {
    
    let title : String
    let subtitle : String
    let angle : Double
    let background : Color
    
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 0)
                .foregroundColor(background)
                .rotationEffect(Angle(degrees: angle))
            
            VStack{
                Text(title)
                    .font(.system(size: 50))
                    .foregroundColor(.white)
                    .bold()
                
                Text(subtitle)
                    .font(.system(size: 30))
                    .foregroundColor(.white)
            }
            .padding(.top,150)
        }
        .frame(width:UIScreen.main.bounds.width * 3,height: 350)
        .offset(y:-150)
    }
}

#Preview {
    HeaderView(title: "To Do List", subtitle: "무엇이든 적어보세요", angle: 15, background: .pink)
}
