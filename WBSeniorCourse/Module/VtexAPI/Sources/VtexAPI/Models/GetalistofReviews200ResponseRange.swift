//
// GetalistofReviews200ResponseRange.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

/** Range of the review&#39;s list. */
public struct GetalistofReviews200ResponseRange: Codable, JSONEncodable, Hashable {

    /** Zero base starting record number. */
    public var from: Double?
    /** Zero base ending record number. */
    public var to: Double?
    /** Total number of reviews on the list. */
    public var total: Double?

    public init(from: Double? = nil, to: Double? = nil, total: Double? = nil) {
        self.from = from
        self.to = to
        self.total = total
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case from
        case to
        case total
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(from, forKey: .from)
        try container.encodeIfPresent(to, forKey: .to)
        try container.encodeIfPresent(total, forKey: .total)
    }
}

