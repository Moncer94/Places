//
//  PlacesResponse.swift
//  Places
//
//  Created by Ahmed Moncer on 23/08/2024.
//

import Foundation

/// A response from the `PlacesService` that includes a `Places` array of `Place`.
struct PlacesResponse: Codable {
    let places: [Place]

    enum CodingKeys: String, CodingKey {
        case places = "locations"
    }
}
