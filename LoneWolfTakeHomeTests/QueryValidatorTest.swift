//
//  QueryValidatorTest.swift
//  LoneWolfTakeHomeTests
//
//  Created by Seun Olalekan on 2022-11-19.
//

import XCTest
@testable import LoneWolfTakeHome

class QueryValidatorTest: XCTestCase {
    var sut : QueryValidator!
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = WeatherQueryValidator()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
    }

    func test_QueryValidator_WhenGivenStringContainingSpecialCharacters_ReturnsFalse(){
//        arrage
        let invalidStringCharacters = "Calgary&&"
        let invalidStringNumbers = "Calgary77"
        
        
//        act
        let invalidCharacterValidation = sut.validate(searchText: invalidStringCharacters)
        let invalidNumberValidation = sut.validate(searchText: invalidStringNumbers)
        
//        assert
        XCTAssertFalse(invalidNumberValidation)
        XCTAssertFalse(invalidCharacterValidation)
        
    }
    
    func test_QueryValidator_WhenGivenEmptySearchText_ReturnsFalse(){
//        arrage
        
        let emptyString = ""
        
//        act
        let invalidEmptyValidation = sut.validate(searchText: emptyString)
        
//        assert
        XCTAssertFalse(invalidEmptyValidation)
    }
    
    func test_QueryValidator_WhenGivenSearchTextWithOnlySpaces_ReturnsFalse(){
//        arrage
        
        let emptyString = "     "
        
//        act
        let invalidEmptyValidation = sut.validate(searchText: emptyString)
        
//        assert
        XCTAssertFalse(invalidEmptyValidation)
    }
    

}
