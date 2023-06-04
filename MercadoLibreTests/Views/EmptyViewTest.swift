//
//  EmptyViewTest.swift
//  MercadoLibreTests
//
//  Created by Christians Bonilla on 3/06/23.
//

import XCTest
@testable import MercadoLibre

final class EmptyViewTest: XCTestCase {

    var sut : EmptyViewManager!
    override func setUpWithError() throws {
        
        sut = EmptyViewManager()
    }

    override func tearDownWithError() throws {
        sut = nil
    }
    

    func testShowEmptyView()  {
        
        sut.showEmptyView(Vista: UIView())
        XCTAssertNotNil(sut.emptyView, "no fue nulo significa que mostro la vista")
    }
    
    func testHideEmptyView()  {
        
        sut.showEmptyView(Vista: UIView())
        sut.hideEmptyView()
        XCTAssertTrue(sut.emptyView.isHidden, "oculte la vista")
        
    }
    
    func testemptyViewEdit()  {
        
        sut.showEmptyView(Vista: UIView())
        sut.emptyView.SetupView(Animation: "Noting", Title: "prueba")
        XCTAssertTrue(sut.emptyView.Titles.text == "prueba" , "Cambio el titulo de la vista")
        
    }

}
