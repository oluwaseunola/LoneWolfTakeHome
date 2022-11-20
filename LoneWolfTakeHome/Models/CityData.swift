//
//  CityData.swift
//  LoneWolfTakeHome
//
//  Created by Seun Olalekan on 2022-11-18.
//

import Foundation

struct CityData : Codable, Identifiable{
    let id = UUID()
    let name: String
    let lat : Double
    let lon : Double
    let country : String
    let state: String
}
