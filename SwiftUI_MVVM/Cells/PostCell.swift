//
//  PostCell.swift
//  SwiftUI_MVVM
//
//  Created by A'zamjon Abdumuxtorov on 02/03/24.
//

import SwiftUI

struct PostCell: View {
    var post:Post
    var body: some View {
        VStack(alignment:.leading){
            Text(post.title!.uppercased()).bold()
            Text(post.body!).padding(.top,3)
        }.padding(5)
    }
}

#Preview {
    PostCell(post: Post())
}
