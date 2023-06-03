//
//  ViewModelTest.swift
//  MercadoLibreTests
//
//  Created by Maria Fernanda Paz Rodriguez on 3/06/23.
//

import XCTest
@testable import MercadoLibre

final class ViewModelTest: XCTestCase {

    var sut : BuscadorViewModel!
    
    override func setUpWithError() throws {
        sut = BuscadorViewModel()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func test_Buscador() throws {
        sut.Busqueda(Busqueda: "Nintendo Switch") { Result  in
            XCTAssertTrue(Result?.results != nil, "Pude modelar la info del servicio")
        }
    }

    
}
