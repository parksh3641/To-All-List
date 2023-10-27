//
//  NewItemView.swift
//  todolist
//
//  Created by 박성현 on 10/27/23.
//

import SwiftUI

struct NewItemView: View {
    @StateObject var viewModel = NewItemViewViewModel()
    @Binding var newItemPresented:Bool
    
    var body: some View {
        VStack{
            Text("새로운 할 일")
                .font(.system(size: 32))
                .bold()
                .padding(.top, 50)
            
            Form {
                TextField("제목",text: $viewModel.title)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                DatePicker("할일",selection: $viewModel.dueDate)
                    .datePickerStyle(GraphicalDatePickerStyle())
                
                
                TLButton(title: "저장",background: .pink) {
                    
                    if viewModel.canSave{
                        viewModel.save()
                        newItemPresented = false
                    }
                    else{
                        viewModel.showAlert = true
                    }
                }
                .padding()
            }
            .alert(isPresented: $viewModel.showAlert){
                Alert(
                    title: Text("에러"),
                    message: Text("모든 빈칸을 채우고 오늘 날짜 또는 이후를 선택해주세요"))
            }
        }
    }
}

#Preview {
    NewItemView(newItemPresented: Binding(get:{
        return true
    }, set: { _ in}))
}
