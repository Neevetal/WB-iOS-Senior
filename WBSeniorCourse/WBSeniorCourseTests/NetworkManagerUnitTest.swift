//
//  NetworkManagerUnitTest.swift
//  WBSeniorCourseTests
//
//  Created by Vitaly Malkov on 02.08.2024.
//

import XCTest
@testable import WBSeniorCourse

final class NetworkManagerTests: XCTestCase {
    var manager: NetworkManager!
    
    override func setUp() {
        super.setUp()
        manager = NetworkManager()
    }
    
    override func tearDown() {
        manager = nil
        super.tearDown()
    }
}

// MARK: - Test methods

extension NetworkManagerTests {
    func testGetRequest() {
        let expectation = self.expectation(description: "GET request should succeed")
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts/1")!
        
        Task {
            do {
                let (data, response) = try await manager.get(url: url)
                DispatchQueue.main.async {
                    XCTAssertNotNil(data, "No data was downloaded.")
                    guard let httpResponse = response as? HTTPURLResponse
                    else {
                        XCTFail("Response was not HTTPURLResponse")
                        expectation.fulfill()
                        return
                    }
                    
                    XCTAssertEqual(httpResponse.statusCode, 200, "HTTP response status code should be 200")
                    expectation.fulfill()
                }
            } catch {
                XCTFail("Request failed with error: \(error)")
                expectation.fulfill()
            }
        }
        
        waitForExpectations(timeout: 10, handler: nil)
    }
    
    func testPostRequest() {
        let expectation = self.expectation(description: "POST request should succeed")
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!
        let json: [String: Any] = ["title": "foo", "body": "bar", "userId": 1]
        let jsonData = try! JSONSerialization.data(withJSONObject: json)
        
        Task {
            do {
                let (data, response) = try await manager.post(url: url, body: jsonData)
                DispatchQueue.main.async {
                    XCTAssertNotNil(data, "No data was downloaded.")
                    guard let httpResponse = response as? HTTPURLResponse
                    else {
                        XCTFail("Response was not HTTPURLResponse")
                        expectation.fulfill()
                        return
                    }
                    
                    XCTAssertEqual(httpResponse.statusCode, 201, "HTTP response status code should be 201")
                    expectation.fulfill()
                }
            } catch {
                XCTFail("Request failed with error: \(error)")
                expectation.fulfill()
            }
        }
        
        waitForExpectations(timeout: 10, handler: nil)
    }
    
    func testPutRequest() {
        let expectation = self.expectation(description: "PUT request should succeed")
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts/1")!
        let json: [String: Any] = ["id": 1, "title": "foo", "body": "bar", "userId": 1]
        let jsonData = try! JSONSerialization.data(withJSONObject: json)
        
        Task {
            do {
                let (data, response) = try await manager.put(url: url, body: jsonData)
                DispatchQueue.main.async {
                    XCTAssertNotNil(data, "No data was downloaded.")
                    guard let httpResponse = response as? HTTPURLResponse
                    else {
                        XCTFail("Response was not HTTPURLResponse")
                        expectation.fulfill()
                        return
                    }
                    
                    XCTAssertEqual(httpResponse.statusCode, 200, "HTTP response status code should be 200")
                    expectation.fulfill()
                }
            } catch {
                XCTFail("Request failed with error: \(error)")
                expectation.fulfill()
            }
        }
        
        waitForExpectations(timeout: 10, handler: nil)
    }
    
    func testDeleteRequest() {
        let expectation = self.expectation(description: "DELETE request should succeed")
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts/1")!
        
        Task {
            do {
                let (_, response) = try await manager.delete(url: url)
                DispatchQueue.main.async {
                    guard let httpResponse = response as? HTTPURLResponse
                    else {
                        XCTFail("Response was not HTTPURLResponse")
                        expectation.fulfill()
                        return
                    }
                    
                    XCTAssertEqual(httpResponse.statusCode, 200, "HTTP response status code should be 200")
                    expectation.fulfill()
                }
            } catch {
                XCTFail("Request failed with error: \(error)")
                expectation.fulfill()
            }
        }
        
        waitForExpectations(timeout: 10, handler: nil)
    }
}
