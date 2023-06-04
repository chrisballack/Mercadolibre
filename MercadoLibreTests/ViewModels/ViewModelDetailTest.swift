//
//  ViewModelDetailTest.swift
//  MercadoLibreTests
//
//  Created by Christians Bonilla on 3/06/23.
//

import XCTest
@testable import MercadoLibre

final class ViewModelDetailTest: XCTestCase {

    var sut : ProductsViewModel!
    
    override func setUpWithError() throws {
        sut = ProductsViewModel()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func test_Productos() throws {
        sut.Product(IdItem: "MLC1142049282"){ Result  in
            XCTAssertTrue(Result != nil, "Pude modelar la info del servicio de productos")
        }
    }

    func test_Description() throws {
        sut.Description(IdItem: "MLC1142049282"){ Result  in
            XCTAssertTrue(Result?.plain_text != nil, "Pude modelar la info del servicio descripcion")
        }
    }
    
}
