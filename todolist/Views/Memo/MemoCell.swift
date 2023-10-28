//
//  MemoCell.swift
//  todolist
//
//  Created by 박성현 on 10/28/23.
//

import SwiftUI

struct MemoCell: View {
    @StateObject var memo : Memo
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(memo.content)
                .font(.body)
                .lineLimit(1)
            
            Text(memo.insertDate,style: .date)
                .font(.caption)
                .foregroundColor(.secondary)
        }
    }
}

#Preview {
    MemoCell(memo: Memo(content: "Test"))
}
