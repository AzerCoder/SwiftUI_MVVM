//
//  SwiftUI_MVVMUITests.swift
//  SwiftUI_MVVMUITests
//
//  Created by A'zamjon Abdumuxtorov on 03/03/24.
//

import XCTest
@testable import SwiftUI_MVVM

final class SwiftUI_MVVMUITests: XCTestCase {
    
    var app: XCUIApplication!
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app = XCUIApplication()
    }
    
    func testWithStaticTest() throws{
        app.launch()
        XCTAssertTrue(app.staticTexts["SwiftUI MVVM"].exists)
    }
    
    func testWithNavigationTitle() throws{
        app.launch()
        XCTAssert(app.navigationBars["SwiftUI MVVM"].exists)
    }
    
    func testWithTableViewExists(){
        
        app.launch()
        
        let ex = expectation(description: "testWithTableViewExists")
        
        AFHttp.get(url: AFHttp.API_POST_LIST, params: AFHttp.paramsEmpty(), handler: { response in
            switch response.result{
            case .success:
                XCTAssertTrue(self.app.tables.element.exists)
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
    
//    func testWithTableViewCellCounts(){
//        
//        app.launch()
//        
//        let ex = expectation(description: "testWithTableViewCellCounts")
//        
//        AFHttp.get(url: AFHttp.API_POST_LIST, params: AFHttp.paramsEmpty(), handler: { response in
//            switch response.result{
//            case .success:
//                XCTAssertEqual(self.app.tables.cells.count, 15)
//                ex.fulfill()
//            case let .failure(error):
//                XCTAssertNil(error)
//                ex.fulfill()
//            }
//        })
//        
//        waitForExpectations(timeout: 10){ (error) in
//            if let error = error{
//                XCTFail("error \(error)")
//            }
//        }
//    }
}
