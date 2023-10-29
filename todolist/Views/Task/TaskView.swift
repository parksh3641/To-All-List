//
//  TaskView.swift
//  todolist
//
//  Created by 박성현 on 10/28/23.
//

import SwiftUI

struct TaskView: View {
    @State var currentDate: Date = .init()
    
    @State var weekSlider: [Date.WeekDay] = []
    @State var currentWeekIndex : Int =  0
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0, content: {
            VStack(alignment: .leading, content: {
                /*@START_MENU_TOKEN@*/Text("Placeholder")/*@END_MENU_TOKEN@*/
                    .font(.system(size: 36,weight: .semibold))
                
                TabView(selection: $currentWeekIndex,
                        content: {
                    ForEach(weekSlider.indices, id: \.self){ index in
                        let week = weekSlider[index]
                        
//                            weekView(week)
//                            .tag(index)
                    }
                })
                .tabViewStyle(.page(indexDisplayMode: .never))
            })
            .padding()
            .frame(maxWidth:.infinity)
            .background{
                Rectangle().fill(.gray.opacity(0.1))
                    //.clipShape(.rect(bottomLeadingRadius: 30,
                    //                bottomTrailingRadius: 30))
                    .ignoresSafeArea()
            }
        })
        .frame(maxWidth:.infinity)
    }
    
    @ViewBuilder
    func weekView(_ week: [Date.WeekDay]) -> some View{
        HStack(spacing:0){
            ForEach(week) {day in
                VStack{
                    Text(day.date.format("E"))
                        .font(.callout)
                        .fontWeight(.medium)
                        //.textScale(.secondary)
                        .foregroundStyle(.gray)
                    
                    Text(day.date.format("dd"))
                        .font(.system(size: 20))
                        .frame(width:40,height: 40)
                }}
        }
    }
    
    
    
}

#Preview {
    TaskView()
}
