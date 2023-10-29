//
//  MemoView.swift
//  todolist
//
//  Created by 박성현 on 10/28/23.
//

import SwiftUI

struct MemoView: View {
    
    @EnvironmentObject var store : MemoStore
    
    @State private var showComposer : Bool = false
    
    var body: some View {
        NavigationView{
            List{
                ForEach(store.list){memo in
                    NavigationLink{
                        DetailView(memo: memo)
                    }label: {
                        MemoCell(memo: memo)
                    }
                }
                .onDelete(perform: store.delete)
            }
            .navigationTitle("메모장")
            .toolbar{
                Button{
                    showComposer = true
                }label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showComposer){
                ComposeView()
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}
#Preview {
    MemoView()
        .environmentObject(MemoStore())
}
