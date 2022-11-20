//
//  WeatherData.swift
//  LoneWolfTakeHome
//
//  Created by Seun Olalekan on 2022-11-18.
//

import Foundation

struct WeatherData : Codable{
    let weather : [Weather]
    let main : Main
    let name : String
}

struct Weather : Codable {
    let main : String
    let description : String
    let icon : String
}

struct Main : Codable {
    let temp : Float
    let feels_like : Float
    let temp_min: Float
    let temp_max : Float
    let pressure:  Float
    let humidity : Float
}
