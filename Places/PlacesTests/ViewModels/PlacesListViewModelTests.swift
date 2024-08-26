//
//  PlacesListViewModelTests.swift
//  PlacesTests
//
//  Created by Ahmed Moncer on 25/08/2024.
//

import XCTest
@testable import Places

@MainActor
final class PlacesListViewModelTests: XCTestCase {

    func testLoadPlacesSuccess() async {
        let mockService = MockPlacesService()
        let viewModel = PlacesListViewModel(placesService: mockService)

        await viewModel.loadDPlaces()

        XCTAssertFalse(viewModel.isLoading)
        XCTAssertTrue(viewModel.places.count == 1)
        XCTAssertNil(viewModel.error)
    }

    func testLoadPlacesFailure() async {
        let mockService = MockPlacesService()
        mockService.shouldReturnError = true
        let viewModel = PlacesListViewModel(placesService: mockService)

        await viewModel.loadDPlaces()

        XCTAssertFalse(viewModel.isLoading)
        XCTAssertTrue(viewModel.places.isEmpty)
        XCTAssertNotNil(viewModel.error)
    }

    func testHandlePlaceViewTabValidURL() {
        let place = Place(name: "Test Place", latitude: 37.7749, longitude: -122.4194)
        let viewModel = PlacesListViewModel(placesService: MockPlacesService())

        guard let url = URL(string: "wikipedia://places?lat=12.345&long=-1234.5678") else {
            XCTFail("URL creation failed")
            return
        }

        let mockApplication = MockUIApplication()

        viewModel.handlePlaceViewTab(with: place)

        XCTAssertEqual(mockApplication.lastOpenedURL, url)
    }

    func testInitialState() {
        let viewModel = PlacesListViewModel(placesService: MockPlacesService())

        XCTAssertTrue(viewModel.places.isEmpty)
        XCTAssertFalse(viewModel.isLoading)
        XCTAssertNil(viewModel.error)
        XCTAssertFalse(viewModel.showingCustomLocation)
    }
}

// Mock for UIApplication to test URL opening
class MockUIApplication: UIApplication {
    var lastOpenedURL: URL?

    override func open(_ url: URL, options: [UIApplication.OpenExternalURLOptionsKey : Any] = [:], completionHandler completion: ((Bool) -> Void)? = nil) {
        lastOpenedURL = url
        completion?(true)
    }
}
