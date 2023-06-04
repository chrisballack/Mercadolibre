//
//  MercadoLibreTests.swift
//  MercadoLibreTests
//
//  Created by Christians Bonilla on 3/06/23.
//

import XCTest
@testable import MercadoLibre

final class ApiClientTests: XCTestCase {

    var sut : APIClientBusquedas!
    
    override func setUpWithError() throws {
        sut = APIClientBusquedas()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func test_Buscador() throws {
        sut.Busqueda(Busqueda: "Nintendo Switch") { response in
            XCTAssertTrue(response != nil, "Pude Obtener la info de la busqueda")
        }
    }

    
}
