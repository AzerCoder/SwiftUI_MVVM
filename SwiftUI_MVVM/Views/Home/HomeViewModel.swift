//
//  HomeViewModel.swift
//  SwiftUI_MVVM
//
//  Created by A'zamjon Abdumuxtorov on 02/03/24.
//

import Foundation

class HomeViewModel: ObservableObject{
    @Published var isLoading = false
    @Published var posts = [Post]()
//    @Published var post = Post()
    
    func apiPostList(){
        isLoading = true
        AFHttp.get(url: AFHttp.API_POST_LIST, params: AFHttp.paramsEmpty(), handler: {respons in
            self.isLoading = false
            switch respons.result{
            case .success:
                let posts = try! JSONDecoder().decode([Post].self, from: respons.data!)
                self.posts = posts
            case let .failure(error):
                print(error)
            }
        })
    }
    
//    func apiPostSingle(id:Int){
//        showProgres()
//        AFHttp.get(url: AFHttp.API_POST_SINGLE + String(id), params: AFHttp.paramsEmpty(), handler: { respons in
//            self.hideProgres()
//            switch respons.result{
//            case .success:
//                let post = try! JSONDecoder().decode(Post.self, from: respons.data!)
//                self.post = post
//            case let .failure(error):
//                print(error)
//            }
//            
//        })
//    }
    
    func apiPostDelete(post:Post, handler: @escaping (Bool)->Void){
        isLoading = true
        AFHttp.del(url: AFHttp.API_POST_DELETE + post.id!, params: AFHttp.paramsEmpty(), handler: {respons in
            self.isLoading = false
            switch respons.result{
            case .success:
                print(respons.result)
                handler(true)
            case let .failure(error):
                print(error)
                handler(false)
            }
        })
    }
    
}
