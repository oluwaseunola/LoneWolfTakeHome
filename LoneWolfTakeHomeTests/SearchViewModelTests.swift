//
//  SearchViewModelTests.swift
//  LoneWolfTakeHomeTests
//
//  Created by Seun Olalekan on 2022-11-19.
//

import XCTest

@testable import LoneWolfTakeHome

class SearchViewModelTests: XCTestCase {
    var sut : SearchViewModel!
    var mockWeatherService : MockWeatherService!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        mockWeatherService = MockWeatherService()
        
        sut = SearchViewModel(weatherService: mockWeatherService, queryValidator: WeatherQueryValidator())
        
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
        mockWeatherService = nil
    }
    
    func test_SearchViewModel_CitesArray_ShouldBeEmpty(){
    
// assert
        XCTAssertTrue(sut.cities.isEmpty)
        
    }
    
    func test_SearchViewModel_CurrentCityWeather_ShouldBeNil(){
    
// assert
        XCTAssertNil(sut.currentCityWeather)
    }
    
    func test_SearchViewModel_IsError_ShouldBeFalse(){
    
// assert
        XCTAssertFalse(sut.isError)
    }
    
    func test_SearchViewModel_IsLoading_ShouldBeFalse(){
    
// assert
        XCTAssertFalse(sut.isLoading)
    }
    
    func test_SearchViewModel_IsTextValid_ShouldBeFalse(){
    
// assert
        XCTAssertFalse(sut.isTextValid)
    }
    
    func test_SearchViewModel_IsSearchTextEmpty_ShouldBeTrue(){
    
// assert
        XCTAssertTrue(sut.searchText.isEmpty)
    }
    
    func test_SearchViewModel_WhenSearchIsCalled_WeatherServiceFetchCitiesMethodIsCalled(){
        
//        act
        sut.search()
    
// assert
        XCTAssertTrue(mockWeatherService.isFetchCitiesCalled)
        
    }
    
    func test_SearchViewModel_WhenFetchWeatherIsCalled_WeatherServiceFetchWeatherMethodIsCalled(){
        
//        act
        sut.fetchWeather(lat: "1.3", lon: "1.4")
    
// assert
        XCTAssertTrue(mockWeatherService.isfetchWeatherCalled)

    }
    
}
