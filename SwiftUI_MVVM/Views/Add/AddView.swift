//
//  AddView.swift
//  SwiftUI_MVVM
//
//  Created by A'zamjon Abdumuxtorov on 02/03/24.
//

import SwiftUI

struct AddView: View {
    @Environment(\.presentationMode) var presentation
    @State var titleTF:String = ""
    @State var bodyTF:String = ""
    @ObservedObject var viewModel = AddViewModel()
    var body: some View {
        NavigationView {
            ZStack{
                VStack{
                    Spacer()
                    TextField("Title:", text: $titleTF)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    TextField("Body:", text: $bodyTF)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.top,10)
                    
                    Button(action: {
                        let post = Post(title: titleTF,body: bodyTF)
                        viewModel.apiPostCreate(post:post, handler: {value in
                            if value{
                                presentation.wrappedValue.dismiss()
                            }
                        })
                        
                    }, label: {
                        Text("Greate").frame(width: 150,height: 50)
                            .foregroundColor(.white)
                            .background(.blue)
                            .cornerRadius(20)
                    }).padding(.top,20)
                    
                    Spacer(minLength: 500)
                }.padding()
                    .background(.gray.opacity(0.2))
                
                if viewModel.isLoading{
                    ProgressView()
                }
            }
            
        }
        .navigationTitle("Add Post")
    }
}

#Preview {
    AddView()
}
