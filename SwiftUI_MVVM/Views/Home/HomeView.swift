//
//  HomeView.swift
//  SwiftUI_MVVM
//
//  Created by A'zamjon Abdumuxtorov on 02/03/24.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel = HomeViewModel()
    @State var shovingEdit = false
    @State var selectedPost: Post?
    
    func delete(indexset: IndexSet){
        let post = viewModel.posts[indexset.first!]
        viewModel.apiPostDelete(post: post, handler: { value in
            if value{
                viewModel.apiPostList()
            }
        })
    }
    
    
    
    var body: some View {
        NavigationView{
            ZStack {
                List{
                    ForEach(viewModel.posts, id:\.id){ post in
                        PostCell(post: post)
                            .onLongPressGesture {
                                selectedPost = post
                                shovingEdit = true
                            }
                    }
                    
                    .onDelete(perform: delete)
                }.listStyle(PlainListStyle())
                
                if viewModel.isLoading{
                    ProgressView()
                }
            }.navigationBarTitle("SwiftUI MVVM",displayMode: .inline)
                .navigationBarItems(
                    leading:
                        Button(action: {
                            viewModel.apiPostList()
                        }, label: {
                            Image(systemName: "arrow.clockwise")
                        }), trailing:
                        NavigationLink(destination: AddView(), label: {
                            Image(systemName: "note.text.badge.plus")
                        }))
                .sheet(isPresented: $shovingEdit, content: {
                    if let post = selectedPost {
                        EditView(post: post)
                    }
                })
            
            
        }.onAppear{
            viewModel.apiPostList()
        }
        
    }
    
}

#Preview {
    HomeView()
}
