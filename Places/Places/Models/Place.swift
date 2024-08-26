//
//  Place.swift
//  Places
//
//  Created by Ahmed Moncer on 23/08/2024.
//

import Foundation

struct Place: Codable, Identifiable {
    let name: String
    let latitude: Double
    let longitude: Double
    let id = UUID()

    init(name: String, latitude: Double, longitude: Double) {
        self.name = name
        self.latitude = latitude
        self.longitude = longitude
    }


    enum CodingKeys: String, CodingKey {
        case name
        case latitude = "lat"
        case longitude = "long"
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        do {
            self.name = try container.decodeIfPresent(String.self, forKey: .name) ?? "Unknown Location"
            self.latitude = try container.decodeIfPresent(Double.self, forKey: .latitude) ?? 0
            self.longitude = try container.decodeIfPresent(Double.self, forKey: .longitude) ?? 0
        } catch {
            throw error
        }
    }
}
