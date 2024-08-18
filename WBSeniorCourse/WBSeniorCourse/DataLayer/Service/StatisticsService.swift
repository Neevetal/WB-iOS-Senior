//
//  StatisticsService.swift
//  WBSeniorCourse
//
//  Created by Vitaly Malkov on 07.08.2024.
//

import SwiftUI
import VtexAPI

final class StatisticsService: ObservableObject {
    
    // MARK: - Property Wrappers
    
    @Published public var selectedExternalTraffic: ExternalTraffic
    @Published public var selectedTrend: Trend
    
    @Published public var productRating: GetProductRating200Response?
    @Published public var reviews: [GetalistofReviews200ResponseDataInner] = []
    
    // MARK: - Properties
    
    public let salesYears: [SalesYear] = SalesYear.arrayMock()
    public let specialists: [MarketingSpecialist] = MarketingSpecialist.specialistsMock()
    public let externalTraffics: [ExternalTraffic] = ExternalTraffic.arrayMock()
    public let trends: [Trend] = Trend.arrayMock()
    
    // MARK: - Initialization and deinitialization
    
    init() {
        let monthIndex = MonthItem.current.id - 1
        self.selectedExternalTraffic = ExternalTraffic.arrayMock()[monthIndex]
        self.selectedTrend = Trend.arrayMock()[monthIndex]
    }
}

// MARK: - Public methods

extension StatisticsService {
    func updateSelectedExternalTraffic(with monthIndex: Int) {
        let index = monthIndex - 1
        selectedExternalTraffic = externalTraffics[index]
    }
}

// MARK: - API

// key fg5kYZDIqhSwEusxgpmh5hWCXWewbC

extension StatisticsService {
    func getProductRating(completion: @escaping (GetProductRating200Response) -> Void) {
        RatingAPI.getProductRating(
            productId: "",
            contentType: "",
            accept: ""
        ) { [weak self] data, error in
            guard let self else { return }
            self.productRating = data
            completion(data!)
        }
    }
    
    func getListOfReviews(completion: @escaping ([GetalistofReviews200ResponseDataInner]) -> Void) {
        ReviewAPI.getalistofReviews(
            searchTerm: "",
            from: "",
            to: "",
            orderBy: "",
            status: false,
            productId: "",
            contentType: "",
            accept: ""
        ) { [weak self] data, error in
            guard let self else { return }
            self.reviews = data?.data ?? []
            completion(data?.data ?? [])
        }
    }
}
