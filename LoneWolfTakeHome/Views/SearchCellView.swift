//
//  SearchCellView.swift
//  LoneWolfTakeHome
//
//  Created by Seun Olalekan on 2022-11-19.
//

import SwiftUI

struct SearchCellView: View {
    var city : CityData
    var body: some View {
        VStack{
            Text("\(city.name), \(city.state), \(city.country)")
        }
    }
}

struct SearchCellView_Previews: PreviewProvider {
    static var previews: some View {
        SearchCellView(city: CityData(name: "", lat: 1.3, lon: 1.3, country: "", state: ""))
    }
}
