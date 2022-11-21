//
//  WeatherQueryValidator.swift
//  LoneWolfTakeHome
//
//  Created by Seun Olalekan on 2022-11-19.
//

import Foundation



class WeatherQueryValidator : QueryValidator {
    
    let validSet = NSCharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ ")
    
    /// Validates user search text
    /// - Parameter searchText: user search text
    /// - Returns: returns whether text is valid or not
    func validate(searchText: String) -> Bool {
        return searchText.rangeOfCharacter(from: validSet.inverted) == nil && !searchText.replacingOccurrences(of: " ", with: "").isEmpty
    }
    
}
