//
//  PlaceMockFactory.swift
//  PlacesTests
//
//  Created by Ahmed Moncer on 25/08/2024.
//

import Foundation

struct PlaceMockFactory {

    /// Creates a mock `Place` with predefined values.
    /// - Parameters:
    ///   - name: The name of the place (default: "Mock Place").
    ///   - latitude: The latitude of the place (default: 0.0).
    ///   - longitude: The longitude of the place (default: 0.0).
    ///   - id: The UUID of the place (default: a new UUID).
    /// - Returns: A `Place` instance with the specified or default values.
    static func makePlace(name: String = "Mock Place",
                          latitude: Double = 0.0,
                          longitude: Double = 0.0,
                          id: UUID = UUID()) -> Place {
        return Place(name: name, latitude: latitude, longitude: longitude)
    }

    /// Creates an array of mock `Place` instances.
    /// - Parameters:
    ///   - count: The number of mock `Place` instances to create (default: 5).
    ///   - baseName: The base name for each place, will append index (default: "Mock Place").
    /// - Returns: An array of `Place` instances.
    static func makePlaces(count: Int = 5, name: String = "Mock Places") -> [Place] {
        return (0..<count).map { index in
            makePlace(name: "\(name) \(index + 1)", latitude: Double(index), longitude: Double(index))
        }
    }
}
