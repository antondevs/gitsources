//
//  Git_SourcesTests.swift
//  Git SourcesTests
//
//  Created by Anton Nadtoka on 08/12/2018.
//  Copyright © 2018 Anton Nadtoka. All rights reserved.
//

import XCTest
@testable import Git_Sources

class Git_SourcesTests: XCTestCase {
    
    var apiLayer:ApiService! = nil

    override func setUp() {
        apiLayer = ApiService()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testRepositoryList() {
        
        let exp = expectation(description: "Repository List")
        
        apiLayer.searchRepositories(pageIndex: 1, pageSize: 10) { (result, error) in
            XCTAssertNil(error, "Error loading repositories \(error?.localizedDescription ?? "")")
            XCTAssertNotNil(result, "Result is null")
            XCTAssert(result?.items?.count == 10)
            
            exp.fulfill()
        }
        
        waitForExpectations(timeout: 8.0, handler: nil)
        
    }
    
    func testRepositoryContent() {
        
        let exp = expectation(description: "Repository Content")
        
        /* Example project on github */
        
        var context = BrowseContext()
        context.owner = "flutter"
        context.parent = ""
        context.path = "/"
        context.repo = "flutter"
        
        apiLayer.fetchDirContent(context: context) { (result, error) in
            XCTAssertNil(error, "Error loading repositories \(error?.localizedDescription ?? "")")
            XCTAssert(result.count > 0)
            exp.fulfill()
        }
        
        waitForExpectations(timeout: 8.0, handler: nil)
        
    }

}
