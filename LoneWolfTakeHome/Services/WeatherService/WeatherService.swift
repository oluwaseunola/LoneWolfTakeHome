//
//  APIService.swift
//  LoneWolfTakeHome
//
//  Created by Seun Olalekan on 2022-11-18.
//

import Foundation

class WeatherService : WeatherServiceProtocol {

    
    private var urlSession : URLSession
    
    
    init(urlSession: URLSession = .shared){
        self.urlSession = urlSession
    }
    
    /// Fetches a list of cities from the user's search text
    /// - Parameters:
    ///   - searchText: user's query
    ///   - completion: completion passing a Result type holding an optional array of CityData objects
    func fetchCities(from searchText: String, completion: @escaping (Result<[CityData]?, Error>)-> Void){
    
        let urlString = "https://api.openweathermap.org/geo/1.0/direct?q=\(searchText)&limit=5&appid=71bd06ca91babce9d7c26e6fb2899550"
        
        guard let url = URL(string:urlString) else{
            return
        }
    
        urlSession.dataTask(with: url) { data, _, error in
            if let error = error {
                print(error)
                completion(.failure(ServiceError.CityDataFetchingError))
            }
            guard let data = data else {
                return
            }
            if let cities = try? JSONDecoder().decode([CityData].self, from: data){
                completion(.success(cities))
            } else{
                completion(.failure(ServiceError.CityDataParsingError))
            }
        }.resume()
        
    }
    
    /// Fetches weather data using a latitude and longitude from a specific city.
    /// - Parameters:
    ///   - lat: latitude of city
    ///   - lon: longitude of city
    ///   - completion: completion passing a Result type holding an optional WeatherData object.
    func fetchWeather(lat: String, lon: String, completion: @escaping (Result<WeatherData?, Error>)-> Void){
        let urlString = "https://api.openweathermap.org/data/2.5/weather?lat=\(lat)&lon=\(lon)&appid=71bd06ca91babce9d7c26e6fb2899550&units=metric"
        
        guard let url = URL(string: urlString ) else{
            return
        }
        
        urlSession.dataTask(with: url) { data, _, error in
            if let error = error {
                print(error)
                completion(.failure(ServiceError.WeatherDataFetchingError))
            }
            guard let data = data else {
                return
            }
            if let weatherData = try? JSONDecoder().decode(WeatherData.self, from: data){
                completion(.success(weatherData))
            }
            else{
                completion(.failure(ServiceError.WeatherDataParsingError))
            }
        }.resume()
    }
    
}
