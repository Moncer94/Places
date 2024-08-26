//
//  PlacesServiceTests.swift
//  PlacesTests
//
//  Created by Ahmed Moncer on 25/08/2024.
//

import XCTest
@testable import Places

final class PlacesServiceTests: XCTestCase {

    override func setUp() {
        super.setUp()
        URLProtocol.registerClass(MockURLProtocol.self)
    }

    override func tearDown() {
        URLProtocol.unregisterClass(MockURLProtocol.self)
        super.tearDown()
    }

    func testFetchPlacesSuccess() async throws {
        // Prepare mock data and response
        let mockJSONData = """
        {
            "places": [
                {"name": "Place 1", "latitude": 0.0, "longitude": 0.0},
                {"name": "Place 2", "latitude": 1.0, "longitude": 1.0}
            ]
        }
        """.data(using: .utf8)!

        MockURLProtocol.requestHandler = { request in
            let response = HTTPURLResponse(
                url: request.url!,
                statusCode: 200,
                httpVersion: nil,
                headerFields: nil
            )!
            return (response, mockJSONData)
        }

        let placesService = PlacesService.shared
        let response = try await placesService.fetchPlaces()

        XCTAssertEqual(response.places.count, 2)
        XCTAssertEqual(response.places.first?.name, "Place 1")
    }


    func testFetchPlacesNetworkError() async {
        MockURLProtocol.requestHandler = { request in
            let response = HTTPURLResponse(
                url: request.url!,
                statusCode: 500,
                httpVersion: nil,
                headerFields: nil
            )!
            return (response, Data())
        }

        let placesService = PlacesService.shared

        do {
            _ = try await placesService.fetchPlaces()
            XCTFail("Expected to throw, but did not")
        } catch {
            XCTAssertEqual(error as? NetworkError, NetworkError.statusNotOk)
        }
    }

    func testFetchPlacesDecodingError() async {
        // Prepare invalid JSON data
        let invalidJSONData = """
        {
            "wrong_key": "This will cause a decoding error"
        }
        """.data(using: .utf8)!

        MockURLProtocol.requestHandler = { request in
            let response = HTTPURLResponse(
                url: request.url!,
                statusCode: 200,
                httpVersion: nil,
                headerFields: nil
            )!
            return (response, invalidJSONData)
        }

        let placesService = PlacesService.shared

        do {
            _ = try await placesService.fetchPlaces()
            XCTFail("Expected to throw, but did not")
        } catch {
            XCTAssertEqual(error as? NetworkError, NetworkError.decode)
        }
    }
}

// Mock URL Protocol to intercept network requests
class MockURLProtocol: URLProtocol {
    static var requestHandler: ((URLRequest) throws -> (HTTPURLResponse, Data))?

    override class func canInit(with request: URLRequest) -> Bool {
        return true
    }

    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        return request
    }

    override func startLoading() {
        guard let handler = MockURLProtocol.requestHandler else {
            XCTFail("Handler is unavailable.")
            return
        }

        do {
            let (response, data) = try handler(request)
            client?.urlProtocol(self, didReceive: response, cacheStoragePolicy: .notAllowed)
            client?.urlProtocol(self, didLoad: data)
            client?.urlProtocolDidFinishLoading(self)
        } catch {
            client?.urlProtocol(self, didFailWithError: error)
        }
    }

    override func stopLoading() {
        super.stopLoading()
    }
}
