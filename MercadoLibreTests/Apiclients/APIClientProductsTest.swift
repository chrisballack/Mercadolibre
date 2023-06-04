//
//  APIClientProductsTest.swift
//  MercadoLibreTests
//
//  Created by Christians Bonilla on 3/06/23.
//

import XCTest
@testable import MercadoLibre

final class APIClientProductsTests: XCTestCase {

    var sut : APIClientProducts!
    
    override func setUpWithError() throws {
        sut = APIClientProducts()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func test_Productos() throws {
        sut.Producto(ItemID: "MLC1142049282") { Result in
            XCTAssertTrue(Result != nil, "Pude Obtener la info del producto")
        }
    }
    
    
    func test_Descripcion() throws {
        sut.Description(ItemID: "MLC1142049282") { Result in
            XCTAssertTrue(Result != nil, "Pude Obtener la info de la Descripcion")
        }
    }

    
}
