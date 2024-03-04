//
//  Post.swift
//  SwiftUI_MVVM
//
//  Created by A'zamjon Abdumuxtorov on 02/03/24.
//

import Foundation

struct Post:Decodable{
    var id:String? = ""
    var title:String? = ""
    var body:String? = ""
    
    init(title: String? = nil, body: String? = nil) {
        self.title = title
        self.body = body
    }
}

