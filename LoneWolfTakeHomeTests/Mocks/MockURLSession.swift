//
//  MockURLSession.swift
//  LoneWolfTakeHomeTests
//
//  Created by Seun Olalekan on 2022-11-18.
//

import Foundation

class MockURLSession : URLProtocol {
    
    static var stubData : Data?
    static var stubError : Error?

    
    override class func canInit(with request: URLRequest) -> Bool {
        return true
    }
    
    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        return request
    }
    
    override func startLoading() {
        
        if let error = MockURLSession.stubError {
            self.client?.urlProtocol(self, didFailWithError: error)
        }else{
            self.client?.urlProtocol(self, didLoad: MockURLSession.stubData ?? Data())
        }
        self.client?.urlProtocolDidFinishLoading(self)
    }
    
    override func stopLoading() {}
    
}
