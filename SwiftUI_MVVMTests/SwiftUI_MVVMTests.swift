//
//  SwiftUI_MVVMTests.swift
//  SwiftUI_MVVMTests
//
//  Created by A'zamjon Abdumuxtorov on 03/03/24.
//

import XCTest
@testable import SwiftUI_MVVM

final class SwiftUI_MVVMTests: XCTestCase {
    
    func testPostListApiResponseNil(){
        let ex = expectation(description: "testPostListApiResponseNil")
        
        AFHttp.get(url: AFHttp.API_POST_LIST, params: AFHttp.paramsEmpty(), handler:{ response in
            switch response.result{
            case .success:
                XCTAssertNotNil(response)
                ex.fulfill()
            case let .failure(error):
                XCTAssertNil(error)
                ex.fulfill()
            }
            
        })
        
        waitForExpectations(timeout: 10){ (error) in 
            if let error = error{
                XCTFail("error \(error)")
            }
        }
    }
    func testPostListApiResponseCount(){
        let ex = expectation(description: "testPostListApiResponseCount")
        
        AFHttp.get(url: AFHttp.API_POST_LIST, params: AFHttp.paramsEmpty(), handler:{ response in
            switch response.result{
            case .success:
                let posts = try? JSONDecoder().decode([Post].self, from: response.data!)
                XCTAssertEqual(posts?.count,15)
                ex.fulfill()
            case let .failure(error):
                XCTAssertNil(error)
                ex.fulfill()
            }
            
        })
        
        waitForExpectations(timeout: 10){ (error) in
            if let error = error{
                XCTFail("error \(error)")
            }
        }
    }
    
    func testPostListApiResponseTitle(){
        let ex = expectation(description: "testPostListApiResponseTitle")
        
        AFHttp.get(url: AFHttp.API_POST_LIST, params: AFHttp.paramsEmpty(), handler:{ response in
            switch response.result{
            case .success:
                let posts = try? JSONDecoder().decode([Post].self, from: response.data!)
                XCTAssertEqual(posts![0].title,"title 1")
                ex.fulfill()
            case let .failure(error):
                XCTAssertNil(error)
                ex.fulfill()
            }
            
        })
        
        waitForExpectations(timeout: 10){ (error) in
            if let error = error{
                XCTFail("error \(error)")
            }
        }
    }
    
//    func testPostDeleteApiResponse(){
//        //serverda bor postni kiritish kere
//        let post = Post(title: "title 2",body: "body 2")
//        let ex = expectation(description: "testPostDeleteApiResponse")
//        // post id sini kiriting
//        AFHttp.del(url: AFHttp.API_POST_DELETE + "2", params: AFHttp.paramsEmpty(), handler: {response in
//            switch response.result{
//            case .success:
//                XCTAssert(true)
//                ex.fulfill()
//            case let .failure(error):
//                XCTAssertNil(false)
//                ex.fulfill()
//            }
//            
//        })
//        
//        waitForExpectations(timeout: 10){ (error) in
//            if let error = error{
//                XCTFail("error \(error)")
//            }
//        }
//    }
    
//    func testPostGreateApiResponse(){
//        //yangi post yarating
//        let post = Post(title: "title 2",body: "body 2")
//        let ex = expectation(description: "testPostGreateApiResponse")
//        
//        AFHttp.post(url: AFHttp.API_POST_CREATE, params: AFHttp.paramsPostCreate(post: post), handler: {response in
//            switch response.result{
//            case .success:
//                XCTAssert(true)
//                ex.fulfill()
//            case let .failure(error):
//                XCTAssertNil(false)
//                ex.fulfill()
//            }
//            
//        })
//        
//        waitForExpectations(timeout: 10){ (error) in
//            if let error = error{
//                XCTFail("error \(error)")
//            }
//        }
//    }
    
    func testPostEditApiResponse(){
        let post = Post(title: "title 2",body: "body 2")
        let ex = expectation(description: "testPostEditApiResponse")
        
        AFHttp.put(url: AFHttp.API_POST_UPDATE + "16", params: AFHttp.paramsPostUpdate(post: post), handler: {response in
            switch response.result{
            case .success:
                XCTAssert(true)
                ex.fulfill()
            case let .failure(error):
                XCTAssertNil(false)
                ex.fulfill()
            }
            
        })
        
        waitForExpectations(timeout: 10){ (error) in
            if let error = error{
                XCTFail("error \(error)")
            }
        }
    }
}

