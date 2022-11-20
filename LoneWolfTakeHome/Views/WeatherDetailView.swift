//
//  WeatherDetailView.swift
//  LoneWolfTakeHome
//
//  Created by Seun Olalekan on 2022-11-19.
//

import SwiftUI

struct WeatherDetailView: View {
    @ObservedObject var viewModel : SearchViewModel
    var city : CityWeatherQuery
    var body: some View {
        ZStack{
            if viewModel.isLoading {
                VStack{
                    Text("Loading")
                    ProgressView()
                }
            } else{
                if let currentCityWeather = viewModel.currentCityWeather{
                    WeatherDetailViewInfo(currentCityWeather: currentCityWeather)
                }
            }
        }.onAppear {
            viewModel.fetchWeather(lat: String(city.lat), lon: String(city.lon))
        }
    }
}


struct WeatherDetailViewInfo : View {
    var currentCityWeather : WeatherData
    var body: some View {
        
        VStack{
            Text(currentCityWeather.name)
                .font(.system(.largeTitle, design: .rounded))
                .bold()
                .padding(.bottom, 20)
            Text("Current temperature: \(String(format: "%.1f", currentCityWeather.main.temp ))°C")
            Text("Feels like : \(String(format: "%.1f", currentCityWeather.main.feels_like))°C")
            Text("High : \(String(format: "%.1f", currentCityWeather.main.temp_max ))°C")
            Text("Low : \(String(format: "%.1f", currentCityWeather.main.temp_min))°C")
            Text("Description : \(currentCityWeather.weather.first?.description ?? "")")
        }
    }
}
