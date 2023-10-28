//
//  TaskView.swift
//  todolist
//
//  Created by 박성현 on 10/28/23.
//

import SwiftUI

extension View{
    @ViewBuilder
    func hSpacing(_ alignment : Alignment) -> some View{
        self.frame(maxWidth:.infinity,alignment: alignment)
    }
    
    func vSpacing(_ alignment : Alignment) -> some View{
        self.frame(maxHeight:.infinity,alignment: alignment)
    }
}
