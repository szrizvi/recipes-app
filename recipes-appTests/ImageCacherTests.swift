//
//  ImageCacherTests.swift
//  recipes-appTests
//
//  Created by Zainab Rizvi on 18/02/2025.
//

import XCTest
import SwiftUI

final class ImageCacherTests: XCTestCase {

        var url: URL!
        var testImage: Image!

        override func setUp() {
            super.setUp()
            testImage = Image(systemName: "star.fill")
            url = URL(string: "https://example.com/testimage.jpg")! // chose first img in api for testing
            ImageCache.cache.removeAll()
        }

        override func tearDown() {
            ImageCache.cache.removeAll()
            super.tearDown()
        }

        func test_cacheIsInitiallyEmpty() {
            XCTAssertNil(ImageCache[url], "cache should be initially empty")
        }
        
    func test_imageCaching() {
            let expectation = self.expectation(description: "image should be cached")

            // making a mock content closure that will be called with the image phase
            let content: (AsyncImagePhase) -> AnyView = { phase in
                if case .success(let image) = phase {
                    XCTAssertEqual(image, self.testImage)
                    XCTAssertNotNil(ImageCache[self.url])
                    expectation.fulfill()
                }
                return AnyView(EmptyView())
            }
            let imageCacher = ImageCacher(url: url, content: content)
            imageCacher.cacheAndRender(phase: .success(testImage)) // mocking success case
            waitForExpectations(timeout: 5, handler: nil)
        }
    
    func test_cachedImageIsAccessed() {

            ImageCache[url] = testImage
            let expectation = self.expectation(description: "image should be accessed from cache")
            let content: (AsyncImagePhase) -> AnyView = { phase in
                if case .success(let image) = phase {
                    XCTAssertEqual(image, self.testImage)
                    expectation.fulfill()
                }
                return AnyView(EmptyView())
            }
            let imageCacher = ImageCacher(url: url, content: content)
            let _ = imageCacher.body // image is already cached, so it should call the content closure with cached image
            waitForExpectations(timeout: 5, handler: nil)
        }

    
        func test_cacheClearance() {
            ImageCache[url] = testImage
            XCTAssertNotNil(ImageCache[url], "image should be cached")
            
            ImageCache.cache.removeAll()
            XCTAssertNil(ImageCache[url], "cache should be empty after clearing")
        }
    }
