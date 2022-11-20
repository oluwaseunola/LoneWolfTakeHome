//
//  Errors.swift
//  LoneWolfTakeHome
//
//  Created by Seun Olalekan on 2022-11-18.
//

import Foundation

enum ServiceError : LocalizedError{
    
    case WeatherDataParsingError,CityDataParsingError,WeatherDataFetchingError,CityDataFetchingError
    
    var errorDescription: String? {
        switch self {
        case .WeatherDataParsingError:
            return NSLocalizedString("There is an issue parsing WeatherData", comment: "")
        case .CityDataParsingError:
            return NSLocalizedString("There is an issue parsing CityData", comment: "")
        case .WeatherDataFetchingError:
            return NSLocalizedString("There is an issue fetching WeatherData", comment: "")
        case .CityDataFetchingError:
            return NSLocalizedString("There is an issue fetching CityData", comment: "")
        }
    }
    
    
}
