//
//  PlacesTests.swift
//  PlacesTests
//
//  Created by Ahmed Moncer on 23/08/2024.
//

import SwiftUI
import XCTest
@testable import Places

@MainActor
final class PlacesListViewTests: XCTestCase {

    func testInitialLoadingState() {
        let viewModel = PlacesListViewModel()
        XCTAssertTrue(viewModel.isLoading)
    }

    func testErrorStateDisplaysNoPlacesMessage() {
        let viewModel = PlacesListViewModel()
        viewModel.error = NSError(domain: "", code: 0, userInfo: nil)

        // Simulate state where an error has occurred
        XCTAssertNotNil(viewModel.error)
        XCTAssertFalse(viewModel.isLoading)
        XCTAssertTrue(viewModel.places.isEmpty)
    }

    func testPlacesListViewModelLoadsPlaces() async {
        let viewModel = PlacesListViewModel()
        await viewModel.loadDPlaces()

        XCTAssertFalse(viewModel.isLoading)
        XCTAssertTrue(viewModel.places.count > 0)  // Assuming loadDPlaces fetches places
    }

    func testCustomLocationPresentation() {
        let viewModel = PlacesListViewModel()
        XCTAssertFalse(viewModel.showingCustomLocation)

        viewModel.showingCustomLocation = true
        XCTAssertTrue(viewModel.showingCustomLocation)
    }

    func testButtonAction() {
        let viewModel = PlacesListViewModel()

        XCTAssertFalse(viewModel.showingCustomLocation)

        // Simulate button tap
        viewModel.showingCustomLocation = true

        XCTAssertTrue(viewModel.showingCustomLocation)
    }
}
