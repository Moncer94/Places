//
//  CustomCoordinatesViewModel.swift
//  Places
//
//  Created by Ahmed Moncer on 25/08/2024.
//

import Foundation
import UIKit

@MainActor
class CustomCoordinatesViewModel: ObservableObject {
    @Published var latitude: String = ""
    @Published var longitude: String = ""

    func handleSubmit() {
        guard [latitude, longitude].allSatisfy({ !$0.isEmpty }) else {
            return
        }
        guard let url = URL(string: "wikipedia://places?lat=\(latitude)&long=\(longitude)") else { return }
        UIApplication.shared.open(url)
    }
}
