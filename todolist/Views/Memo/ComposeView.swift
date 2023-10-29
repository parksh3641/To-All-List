//
//  ComposeView.swift
//  todolist
//
//  Created by 박성현 on 10/28/23.
//

import SwiftUI

struct ComposeView: View {
    @EnvironmentObject var store : MemoStore
    
    var memo : Memo? = nil
    
    @Environment(\.dismiss) var dismiss
    
    @State private var content : String = ""
    
    var body: some View {
        NavigationView{
            
            VStack{
                TextEditor(text: $content)
                    .padding()
                    .onAppear{
                        //화면이 처음 나타날때 초기화
                        if let memo = memo{
                            content = memo.content
                        }
                    }
            }
            .navigationTitle(memo != nil ? "메모 편집" : "새 메모")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItemGroup(placement: .navigationBarLeading){
                    Button{
                        dismiss()
                    }label: {
                        Text("취소")
                    }
                }
                
                ToolbarItemGroup(placement: .navigationBarTrailing){
                    Button{
                        if let memo = memo{
                            store.update(memo: memo, content: content)
                        } else {
                            store.insert(memo: content)
                        }
                        dismiss()
                    }label: {
                        Text("저장")
                    }
                }
            }
        }
    }
}

#Preview {
    ComposeView()
        .environmentObject(MemoStore())
}
