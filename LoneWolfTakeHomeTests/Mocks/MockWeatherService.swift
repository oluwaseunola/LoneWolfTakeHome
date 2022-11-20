//
//  MockWeatherService.swift
//  LoneWolfTakeHomeTests
//
//  Created by Seun Olalekan on 2022-11-19.
//

import Foundation
@testable import LoneWolfTakeHome

class MockWeatherService : WeatherServiceProtocol {
    
    var isFetchCitiesCalled = false
    var isfetchWeatherCalled = false
    private var cityDataStub = CityData(name: "Calgary", lat: 1.2, lon: 1.2, country: "CA", state: "AB")
    private var weatherDataStub = WeatherData(weather: [], main: Main(temp: 1.1, feels_like: 1.1, temp_min: 1.1, temp_max: 1.1, pressure: 1.1, humidity: 1.1), name: "")
    
    
    
    func fetchCities(from searchText: String, completion: @escaping (Result<[CityData]?, Error>) -> Void) {
        isFetchCitiesCalled = true
        completion(.success([cityDataStub]))

    }
    
    func fetchWeather(lat: String, lon: String, completion: @escaping (Result<WeatherData?, Error>) -> Void) {
        isfetchWeatherCalled = true
        completion(.success(weatherDataStub))

        
    }
    
    
}

