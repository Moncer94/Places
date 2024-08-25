//
//  PlacesListViewModel.swift
//  Places
//
//  Created by Ahmed Moncer on 23/08/2024.
//

import Foundation
import UIKit

/// View model responsible for fetching and managing a list of places.
@MainActor
class PlacesListViewModel: ObservableObject {
    private let placesService: PlacesServiceProtocol

    @Published var places: [Place] = []
    @Published var isLoading = false
    @Published var error: Error?
    @Published var showingCustomLocation = false

    init(placesService: PlacesServiceProtocol = PlacesService.shared) {
        self.placesService = placesService
    }

    func loadDPlaces() async {
        isLoading = true
        Task {
            do {
                let response = try await placesService.fetchPlaces()
                places = response.places
                isLoading = false
            } catch {
                self.error = error
            }
        }
    }

    func handlePlaceViewTab(with place: Place) {
        guard let url = URL(string: "wikipedia://places?lat=\(place.latitude)&long=\(place.longitude)") else { return }
        UIApplication.shared.open(url)
    }
}

