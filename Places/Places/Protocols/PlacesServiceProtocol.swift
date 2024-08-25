//
//  PlacesServiceProtocol.swift
//  Places
//
//  Created by Ahmed Moncer on 23/08/2024.
//


import Foundation

/// Protocol that defines the requirements to fetch places data.
protocol PlacesServiceProtocol {

    /// Asynchronously fetches a list of places.
    /// - Returns: An array of `Place` instances.
    /// - Throws: An error if the data fetching or decoding fails.
    func fetchPlaces() async throws -> PlacesResponse
}
