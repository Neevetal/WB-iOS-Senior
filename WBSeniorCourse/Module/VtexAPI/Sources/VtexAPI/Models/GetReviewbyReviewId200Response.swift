//
// GetReviewbyReviewId200Response.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Foundation
#if canImport(AnyCodable)
import AnyCodable
#endif

/**  */
public struct GetReviewbyReviewId200Response: Codable, JSONEncodable, Hashable {

    /** If the review was approved (`true`) or not (`false`). */
    public var approved: Bool?
    /** Review ID. */
    public var id: String?
    /** Review's locale. */
    public var locale: String?
    /** Review's origin location. */
    public var location: String?
    /** Past reviews of the same product. */
    public var pastReviews: String?
    /** Product ID. */
    public var productId: String?
    /** Customer rating. */
    public var rating: Double?
    /** Review's date and time. */
    public var reviewDateTime: String?
    /** Reviewer name. */
    public var reviewerName: String?
    /** Review's search date. */
    public var searchDate: String?
    /** Shopper email. */
    public var shopperId: String?
    /** SKU ID. */
    public var sku: String?
    /** Review's text. */
    public var text: String?
    /** Review's title. */
    public var title: String?
    /** If the reviewer is a verified purchaser (`true`) or not (`false`). */
    public var verifiedPurchaser: Bool?

    public init(approved: Bool? = nil, id: String? = nil, locale: String? = nil, location: String? = nil, pastReviews: String? = nil, productId: String? = nil, rating: Double? = nil, reviewDateTime: String? = nil, reviewerName: String? = nil, searchDate: String? = nil, shopperId: String? = nil, sku: String? = nil, text: String? = nil, title: String? = nil, verifiedPurchaser: Bool? = nil) {
        self.approved = approved
        self.id = id
        self.locale = locale
        self.location = location
        self.pastReviews = pastReviews
        self.productId = productId
        self.rating = rating
        self.reviewDateTime = reviewDateTime
        self.reviewerName = reviewerName
        self.searchDate = searchDate
        self.shopperId = shopperId
        self.sku = sku
        self.text = text
        self.title = title
        self.verifiedPurchaser = verifiedPurchaser
    }

    public enum CodingKeys: String, CodingKey, CaseIterable {
        case approved
        case id
        case locale
        case location
        case pastReviews
        case productId
        case rating
        case reviewDateTime
        case reviewerName
        case searchDate
        case shopperId
        case sku
        case text
        case title
        case verifiedPurchaser
    }

    // Encodable protocol methods

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(approved, forKey: .approved)
        try container.encodeIfPresent(id, forKey: .id)
        try container.encodeIfPresent(locale, forKey: .locale)
        try container.encodeIfPresent(location, forKey: .location)
        try container.encodeIfPresent(pastReviews, forKey: .pastReviews)
        try container.encodeIfPresent(productId, forKey: .productId)
        try container.encodeIfPresent(rating, forKey: .rating)
        try container.encodeIfPresent(reviewDateTime, forKey: .reviewDateTime)
        try container.encodeIfPresent(reviewerName, forKey: .reviewerName)
        try container.encodeIfPresent(searchDate, forKey: .searchDate)
        try container.encodeIfPresent(shopperId, forKey: .shopperId)
        try container.encodeIfPresent(sku, forKey: .sku)
        try container.encodeIfPresent(text, forKey: .text)
        try container.encodeIfPresent(title, forKey: .title)
        try container.encodeIfPresent(verifiedPurchaser, forKey: .verifiedPurchaser)
    }
}

