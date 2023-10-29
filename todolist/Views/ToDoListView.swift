//
//  ToDoListView.swift
//  todolist
//
//  Created by 박성현 on 10/27/23.
//

import FirebaseFirestoreSwift
import SwiftUI

struct ToDoListView: View {
    @StateObject var viewModel : ToDoListViewViewModel
    @FirestoreQuery var items:[ToDoListItem]
    
    init(userId:String){
        self._items = FirestoreQuery(
            collectionPath: "users/\(userId)/todos"
        )
        self._viewModel = StateObject(
            wrappedValue: ToDoListViewViewModel(userId: userId))
    }
    
    var body: some View {
        NavigationView{
            VStack{
                List(items){
                    item in ToDoListitemView(item: item)
                        .swipeActions{
                            Button("삭제")
                            {
                                viewModel.delete(id: item.id)
                            }
                            .tint(.red)
                        }
                }
            }
            .navigationTitle("할 일 목록")
            .toolbar{
                Button{
                    viewModel.showingNewItemView = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $viewModel.showingNewItemView, content: {
                NewItemView(newItemPresented: $viewModel.showingNewItemView)
            })
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

#Preview {
    ToDoListView(userId: "teWe8hT8pXc19AWn7tpVHeeb7Jm1")
}
