//
//  SearchListView.swift
//  LoneWolfTakeHome
//
//  Created by Seun Olalekan on 2022-11-19.
//

import SwiftUI

struct SearchListView: View {
    @ObservedObject var viewModel : SearchViewModel
    var body: some View {
        
        ZStack{
            if viewModel.isLoading {
                VStack{
                    Text("Loading")
                    ProgressView()
                }
            } else if viewModel.cities.isEmpty{
                VStack{
                    Text("Hmmm, we can't seem to find what you're looking for")
                        .multilineTextAlignment(.center)
                }
            } else if viewModel.isError {
                Text("Error")
                    .multilineTextAlignment(.center)
            }else{
                
                List(viewModel.cities){ city in
                    NavigationLink {
                        WeatherDetailView(viewModel: viewModel, city: CityWeatherQuery(lat: city.lat, lon: city.lon))
                    } label: {
                        SearchCellView(city: city)
                    }
                }
            }
        }
        .onAppear {
            viewModel.search()
        }
    }
}

