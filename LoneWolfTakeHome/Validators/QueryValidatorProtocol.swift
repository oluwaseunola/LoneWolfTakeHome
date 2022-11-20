//
//  QueryValidatorProtocol.swift
//  LoneWolfTakeHome
//
//  Created by Seun Olalekan on 2022-11-19.
//

import Foundation

protocol QueryValidator {
    func validate (searchText: String) -> Bool
}
