//
//  LoneWolfTakeHomeApp.swift
//  LoneWolfTakeHome
//
//  Created by Seun Olalekan on 2022-11-18.
//

import SwiftUI

@main
struct LoneWolfTakeHomeApp: App {
    let searchViewModel = SearchViewModel(weatherService: WeatherService(), queryValidator: WeatherQueryValidator())
    
    var body: some Scene {
        WindowGroup {
            SearchView(viewModel: searchViewModel)
        }
    }
}
