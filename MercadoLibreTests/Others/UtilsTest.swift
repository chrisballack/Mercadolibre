//
//  UtilsTest.swift
//  MercadoLibreTests
//
//  Created by Christians Bonilla on 3/06/23.
//

import XCTest
@testable import MercadoLibre

final class UtilsTest: XCTestCase {

    var sut : Utils!
    override func setUpWithError() throws {
        sut = Utils()
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_Currencyformat(){
        
        XCTAssertNotNil(sut.Currency(Number: 10000), "si trajo el valor")
        
    }

}
