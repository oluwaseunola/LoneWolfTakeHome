//
//  WeatherServiceProtocol.swift
//  LoneWolfTakeHome
//
//  Created by Seun Olalekan on 2022-11-18.
//

import Foundation

protocol WeatherServiceProtocol {
    
    func fetchCities(from searchText: String, completion: @escaping (Result<[CityData]?, Error>)-> Void)
    func fetchWeather(lat: String, lon: String, completion: @escaping (Result<WeatherData?, Error>)-> Void)
    
}
