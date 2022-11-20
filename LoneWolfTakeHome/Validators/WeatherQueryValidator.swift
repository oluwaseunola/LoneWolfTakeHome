//
//  WeatherQueryValidator.swift
//  LoneWolfTakeHome
//
//  Created by Seun Olalekan on 2022-11-19.
//

import Foundation



class WeatherQueryValidator : QueryValidator {
    
    private let invalidSet = CharacterSet.letters.inverted
    
    /// Validates user search text
    /// - Parameter searchText: user search text
    /// - Returns: returns whether text is valid or not
    func validate(searchText: String) -> Bool {
        return searchText.rangeOfCharacter(from: invalidSet) == nil && !searchText.isEmpty
    }
    
}
