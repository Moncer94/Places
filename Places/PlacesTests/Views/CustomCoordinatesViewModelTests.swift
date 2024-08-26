//
//  CustomCoordinatesViewModelTests.swift
//  PlacesTests
//
//  Created by Ahmed Moncer on 25/08/2024.
//

import XCTest
@testable import Places

@MainActor
final class CustomCoordinatesViewModelTests: XCTestCase {

    func testInitialState() {
        let viewModel = CustomCoordinatesViewModel()
        XCTAssertEqual(viewModel.latitude, "")
        XCTAssertEqual(viewModel.longitude, "")
    }

    func testValidCoordinatesSubmission() {
        let viewModel = CustomCoordinatesViewModel()
        viewModel.latitude = "37.7749"
        viewModel.longitude = "-122.4194"

        viewModel.handleSubmit()
    }

    func testInvalidCoordinatesSubmission() {
        let viewModel = CustomCoordinatesViewModel()
        viewModel.latitude = "invalid_latitude"
        viewModel.longitude = "invalid_longitude"

        viewModel.handleSubmit()
    }

    func testPartialCoordinatesSubmission() {
        let viewModel = CustomCoordinatesViewModel()
        viewModel.latitude = "37.7749"
        viewModel.longitude = ""

        viewModel.handleSubmit()
    }
}
