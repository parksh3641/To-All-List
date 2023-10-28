//
//  MemoView.swift
//  todolist
//
//  Created by 박성현 on 10/28/23.
//

import SwiftUI

struct MemoView: View {
    
    @EnvironmentObject var store : MemoStore
    
    
    var body: some View {
        NavigationView{
            List(store.list){memo in 
                MemoCell(memo: memo)
            }
            .navigationTitle("내 메모")
        }
    }
}
#Preview {
    MemoView()
        .environmentObject(MemoStore())
}
