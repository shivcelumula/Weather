//
//  WeatherServiceTests.swift
//  WeatherTests
//
//  Created by Shiva Teja Celumula on 2/4/26.
//

import XCTest
@testable import Weather

final class WeatherServiceTests: XCTestCase {

    func testWeatherDecoding() {
        let data = loadData()
        let response = try? JSONDecoder().decode(WeatherResponse.self, from: data)
        XCTAssertNotNil(response)
        XCTAssertEqual(response?.name, "London")
        XCTAssertEqual(response?.weather.description, "overcast clouds")
        XCTAssertEqual(response?.wind.speed, 3.13)
    }
    
    func loadData() -> Data {
        let bundle = Bundle(for: type(of: self))
        let url = bundle.url(forResource: "weather", withExtension: "json")!
        return try! Data(contentsOf: url)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
