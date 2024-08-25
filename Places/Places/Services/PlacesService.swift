//
//  PlacesService.swift
//  Places
//
//  Created by Ahmed Moncer on 23/08/2024.
//

import Foundation

/// An actor that conforms to `PlacesServiceProtocol` and handles fetching places.
actor PlacesService: PlacesServiceProtocol {
    static let shared = PlacesService()
    func fetchPlaces() async throws -> PlacesResponse {

        //create the new url
        guard let url = URL(string: "https://raw.githubusercontent.com/abnamrocoesd/assignment-ios/main/locations.json") else {
            throw NetworkError.invalidURL
        }

        //create a new urlRequest passing the url
        let request = URLRequest(url: url)

        //run the request and retrieve both the data and the response of the call
        let (data, response) = try await URLSession.shared.data(for: request)

        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else{
            throw NetworkError.statusNotOk
        }

        //checks if there are errors regarding the HTTP status code and decodes using the passed struct
        guard let result = try? JSONDecoder().decode(PlacesResponse.self, from: data) else {
            throw NetworkError.decode
        }

        return result
    }
}
