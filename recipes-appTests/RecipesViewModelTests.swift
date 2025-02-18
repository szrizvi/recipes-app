//
//  RecipesViewModelTests.swift
//  recipes-appTests
//
//  Created by Zainab Rizvi on 18/02/2025.
//

import XCTest

final class RecipesViewModelTests: XCTestCase {

    private var sut: RecipesViewModel!
    
    override func setUp() {
        super.setUp()
        sut = RecipesViewModel()
    }
    
    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func test_fetchCorrectData() {
        let expectation = self.expectation(description: "fetch recipes data")
        
        Task {
            await sut.fetchData()
            XCTAssertFalse(sut.recipes.isEmpty, "recipes list should not be empty after fetching")
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 5.0)
    }
    
    func test_emptyData() {
        let expectation = self.expectation(description: "fetch empty data")
        
        Task {
            await sut.fetchData(url: URL(string: "https://d3jbb8n5wk0qxi.cloudfront.net/recipes-empty.json"))
            XCTAssertTrue(sut.recipes.isEmpty, "recipes list should be empty after fetching empty recipe list")
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 5.0)
        
    }
    
    func test_malformedData() {
        let expectation = self.expectation(description: "fetch malformed data")
        
        Task {
            await sut.fetchData(url: URL(string: "https://d3jbb8n5wk0qxi.cloudfront.net/recipes-malformed.json"))
            XCTAssertTrue(sut.recipes.isEmpty, "recipes list should not be displayed because data was malformed")
            XCTAssertEqual(sut.errorMessage, "Recipes cannot be displayed at the moment.", "error message should be non-nil since data is malformed")
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 5.0)
        
    }
}
