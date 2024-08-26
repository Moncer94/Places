//
//  MockPlacesService.swift
//  PlacesTests
//
//  Created by Ahmed Moncer on 25/08/2024.
//

import Foundation

// Mock service conforming to the PlacesServiceProtocol
class MockPlacesService: PlacesServiceProtocol {
    var shouldReturnError = false

    func fetchPlaces() async throws -> PlacesResponse {
        if shouldReturnError {
            throw NSError(domain: "MockError", code: 1, userInfo: nil)
        } else {
            return PlacesResponse(places: [Place(name: "Place 1", latitude: 0.0, longitude: 0.0)])
        }
    }
}
