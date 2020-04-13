//
//  exampleTests.swift
//  exampleTests
//
//  Created by 林 耀祖 on 2020/04/13.
//  Copyright © 2020 林 耀祖. All rights reserved.
//

import XCTest
import Foundation

class HttpRequest{
    typealias completeClosure = ( _ data: Data?, _ error: Error?)->Void
    
    func fetch(url:URL, callback: @escaping completeClosure){
        
        //traditional
        URLSession.shared.dataTask(with: url) { (data, response, error) in

            if let data = data {
                callback(data, error)
            }
        }.resume()
    }
}

class exampleTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        guard let url = URL(string: "http://tutorial-mysiteapp.herokuapp.com/api/profile/?format=json") else {
            fatalError("URL can't be empty")
        }
        
        let request = HttpRequest()
        
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
