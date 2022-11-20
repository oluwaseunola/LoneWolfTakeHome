//
//  SearchViewModel.swift
//  LoneWolfTakeHome
//
//  Created by Seun Olalekan on 2022-11-19.
//

import Foundation

class SearchViewModel : ObservableObject{
    
    @Published var cities : [CityData] = []
    @Published var currentCityWeather : WeatherData?
    @Published var isError = false
    @Published var isLoading = false
    @Published var isTextValid = false
    @Published var searchText : String {
        didSet{
            isTextValid = validator.validate(searchText: searchText)
        }
    }
    
    private var weatherService : WeatherServiceProtocol
    private var validator : QueryValidator
    
    init(weatherService : WeatherServiceProtocol, queryValidator: QueryValidator){
        self.weatherService = weatherService
        self.validator = queryValidator
        self.searchText = ""
    }
    
    
    /// Calls on the Weather Service to fetch queried city
    func search(){
        isLoading = true
        
        weatherService.fetchCities(from: searchText) { [weak self] result in
            
            switch result{
                
            case .success(let data):
                DispatchQueue.main.async{
                guard let data = data else {return}
                self?.cities = data
                self?.isError = false
                self?.isLoading = false}
            case .failure(_):
                DispatchQueue.main.async{
                    self?.isError = true
                self?.isLoading = false}
            }
        }
        
    }
    
    /// Calls on the Weather Service to fetch specific city weather data.
    /// - Parameters:
    ///   - lat: latitude of  city
    ///   - lon: longitude of city
    func fetchWeather(lat: String, lon: String){
        isLoading = true
        
        weatherService.fetchWeather(lat: lat , lon: lon) { [weak self] result in
            switch result{
                
            case .success(let data):
                DispatchQueue.main.async{
                guard let data = data else {return}
                self?.currentCityWeather = data
                self?.isError = false
                self?.isLoading = false}
            case .failure(_):
                DispatchQueue.main.async{
                    self?.isError = true
                self?.isLoading = false}
            }
        }
    }
    
    
}
