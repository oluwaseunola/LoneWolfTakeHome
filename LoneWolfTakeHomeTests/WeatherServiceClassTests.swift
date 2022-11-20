//
//  LoneWolfTakeHomeTests.swift
//  LoneWolfTakeHomeTests
//
//  Created by Seun Olalekan on 2022-11-18.
//

import XCTest
@testable import LoneWolfTakeHome

class WeatherServiceClassTests: XCTestCase {
    var sut : WeatherService!
    
    override func setUpWithError() throws {
        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [MockURLSession.self]
        let urlSession = URLSession(configuration: config)
        sut = WeatherService(urlSession: urlSession )
    }
    
    override func tearDownWithError() throws {
        sut = nil
    }
    
    
    func test_WeatherService_WhenGivenSuccessfulResponse_ReturnsNonNilCityData(){
        //        arrage
        
        let jsonString = "[{\"name\":\"Leeds\", \"lat\":53.7974185, \"lon\":-1.5437941,\"country\": \"GB\",\"state\":\"England\"}]"
        MockURLSession.stubData = jsonString.data(using: .utf8)
        
        
        let expectation = self.expectation(description: "CityData response expectation")
        //      act
        
        sut.fetchCities(from: "Leeds") { result in
            
            switch result{
                
            case .success(let data):
                //    assert
                XCTAssertNotNil(data, "Expected a non nil array of CityData objects but received nil")
                expectation.fulfill()
            case .failure(_):
                break
            }
            
        }
        
        waitForExpectations(timeout: 5)
    }
    
    func test_WeatherService_WhenGivenImproperJSONResponse_ReturnsCityDataParsingError(){
        
        //        arrage
        
        let jsonString = "[{\"name\":\"Leeds\", \"latitude\":53.7974185, \"longitude\":-1.5437941,\"country\": \"GB\",\"state\":\"England\"}]"
        MockURLSession.stubData = jsonString.data(using: .utf8)
        
        
        let expectation = self.expectation(description: "CityData response expectation")
        //      act
        
        sut.fetchCities(from: "Leeds") { result in
            
            switch result{
                
            case .success(_):
                break
            case .failure(let error):
                //    assert
                if let error = error as? ServiceError {
                    XCTAssertEqual(error, ServiceError.CityDataParsingError)
                    expectation.fulfill()
                }
                
            }
        }
        
        waitForExpectations(timeout: 5)
    }
    
    func test_WeatherService_WhenGivenNetworkFetchError_ReturnCityDataFetchingError(){
        //        arrage
        let expectation = self.expectation(description: "Expect CityData Fetch Error")
        MockURLSession.stubError = ServiceError.CityDataFetchingError
        
        
        //        act
        sut.fetchCities(from: "Leeds") { result in
            
            switch result{
                
            case .success(_):
                break
            case .failure(let error):
                //              assert
                if let error = error as? ServiceError {
                    XCTAssertEqual(error, ServiceError.CityDataFetchingError)
                    expectation.fulfill()
                }
            }
        }
        
        waitForExpectations(timeout: 5)
        
        
    }
    
    func test_WeatherService_WhenGivenSuccessfulResponse_ReturnsNonNilWeatherData(){
        //        arrage
        
        let jsonString = "{\"weather\":[{\"main\":\"Cloud\",\"description\":\"Hot\", \"icon\":\"cloud\"}], \"main\":{\"temp\":5.04,\"feels_like\":5.03,\"temp_min\":4.043,\"temp_max\":5.32,\"pressure\":5.33,\"humidity\":5.64}, \"name\": \"Calgary\"}"
        
        MockURLSession.stubData = jsonString.data(using: .utf8)
        
        
        let expectation = self.expectation(description: "WeatherData response expectation")
        //      act
        
        sut.fetchWeather(lat: "4.32", lon: "5.34") { result in
            switch result{
                
            case .success(let data):
                //    assert
                XCTAssertNotNil(data, "Expected a non nil WeatherData object but received nil")
                expectation.fulfill()
            case .failure(_):
                break
            }
            
        }
        
        waitForExpectations(timeout: 5)
    }
    
    
    func test_WeatherService_WhenGivenImproperJSONResponse_ReturnsWeatherDataParsingError(){
        
        //        arrage
        
        let jsonString = "{\"weather\":[{\"main\":\"Cloud\",\"description\":\"Hot\", \"icon\":\"cloud\"}], \"main\":{\"temp\":5.04,\"feels_like_weather\":5.03,\"temp_minimum\":4.043,\"temp_max\":5.32,\"pressure\":5.33,\"humidity\":5.64}, \"name\": \"Calgary\"}"
        
        MockURLSession.stubData = jsonString.data(using: .utf8)
        
        
        let expectation = self.expectation(description: "WeatherData response expectation")
        //      act
        
        sut.fetchWeather(lat: "4.32", lon: "5.34") { result in
            switch result{
                
            case .success(_):
                break
            case .failure(let error):
                // assert
                if let error = error as? ServiceError {
                    XCTAssertEqual(error, ServiceError.WeatherDataParsingError)
                    expectation.fulfill()
                }
                
            }
            
        }
        
        waitForExpectations(timeout: 5)
    }
    
    func test_WeatherService_WhenGivenNetworkFetchError_ReturnWeatherDataFetchingError(){
        //        arrage
        let expectation = self.expectation(description: "Expect CityData Fetch Error")
        MockURLSession.stubError = ServiceError.WeatherDataFetchingError
        
        
        //        act
        sut.fetchWeather(lat: "4.32", lon: "5.34") { result in
            switch result{
                
            case .success(_):
                break
            case .failure(let error):
                // assert
                if let error = error as? ServiceError {
                    XCTAssertEqual(error, ServiceError.WeatherDataFetchingError)
                    expectation.fulfill()
                }
                
            }
            
        }
        
        waitForExpectations(timeout: 5)
        
        
    }
    
}

