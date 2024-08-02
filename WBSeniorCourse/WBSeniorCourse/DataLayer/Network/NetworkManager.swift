//
//  NetworkManager.swift
//  WBSeniorCourse
//
//  Created by Vitaly Malkov on 02.08.2024.
//

import Foundation

final class NetworkManager {
    
    // MARK: - Properties
    
    private let session = URLSession.shared
}

// MARK: - Public methods

extension NetworkManager {
    func get(url: URL) async throws -> (Data, URLResponse) {
        var request = URLRequest(url: url)
        request.httpMethod = HTTPMethod.get.rawValue
        return try await session.data(for: request)
    }
    
    func post(url: URL, body: Data?) async throws -> (Data, URLResponse) {
        var request = URLRequest(url: url)
        request.httpMethod = HTTPMethod.post.rawValue
        request.httpBody = body
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        return try await session.data(for: request)
    }
    
    func put(url: URL, body: Data?) async throws -> (Data, URLResponse) {
        var request = URLRequest(url: url)
        request.httpMethod = HTTPMethod.put.rawValue
        request.httpBody = body
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        return try await session.data(for: request)
    }
    
    func delete(url: URL) async throws -> (Data, URLResponse) {
        var request = URLRequest(url: url)
        request.httpMethod = HTTPMethod.delete.rawValue
        return try await session.data(for: request)
    }
}
