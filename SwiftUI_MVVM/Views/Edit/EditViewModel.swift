//
//  EditViewModel.swift
//  SwiftUI_MVVM
//
//  Created by A'zamjon Abdumuxtorov on 02/03/24.
//

import Foundation

class EditViewModel:ObservableObject{
    @Published var isLoading = false
    
    func apiPostUpdate(post: Post,handler: @escaping (Bool)->Void){
        isLoading = true
        AFHttp.put(url: AFHttp.API_POST_UPDATE + post.id!, params: AFHttp.paramsPostUpdate(post: post), handler: {respons in
            self.isLoading = true
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
