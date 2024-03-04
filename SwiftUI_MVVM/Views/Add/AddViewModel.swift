//
//  AddViewModel.swift
//  SwiftUI_MVVM
//
//  Created by A'zamjon Abdumuxtorov on 02/03/24.
//

import Foundation

class AddViewModel:ObservableObject{
    @Published var isLoading = false
    
    func apiPostCreate(post:Post,handler: @escaping (Bool)->Void){
        isLoading = true
        AFHttp.post(url: AFHttp.API_POST_CREATE, params: AFHttp.paramsPostCreate(post: post), handler: {respons in
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
