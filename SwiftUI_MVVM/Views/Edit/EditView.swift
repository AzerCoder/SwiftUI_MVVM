//
//  EditView.swift
//  SwiftUI_MVVM
//
//  Created by A'zamjon Abdumuxtorov on 02/03/24.
//

import SwiftUI

struct EditView: View {
    @Environment(\.presentationMode) var presentation
    @State var titleTF = ""
    @State var bodyTF = ""
    @ObservedObject var viewModel = EditViewModel()
    var post: Post?
    
    var body: some View {
        
        NavigationView{
            ZStack{
                VStack{
                    Spacer()
                    TextField("Title:", text: $titleTF)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    TextField("Body:", text: $bodyTF)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.top,10)
                    
                    Button(action: {
                        if var post = post {
                            post.title = titleTF
                            post.body = bodyTF
                            
                            viewModel.apiPostUpdate(post: post, handler: { value in
                                if value{
                                    presentation.wrappedValue.dismiss()
                                }
                            })
                        }
                        
                    }, label: {
                        Text("Update").frame(width: 150,height: 50)
                            .foregroundColor(.white)
                            .background(.blue)
                            .cornerRadius(20)
                    }).padding(.top,20)
                    Spacer(minLength: 450)
                    
                }.padding()
                    .background(.gray.opacity(0.2))
                    .navigationBarTitle("Update Post",displayMode: .inline)
                
                if viewModel.isLoading{
                    ProgressView()
                }
            }
        }.onAppear{
            if let post = post {
                titleTF = post.title!
                bodyTF = post.body!
            }
        }
    }
}
#Preview {
    EditView()
}
