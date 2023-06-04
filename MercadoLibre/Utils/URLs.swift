//
//  URLs.swift
//  MercadoLibre
//
//  Created by Christians Bonilla on 3/06/23.
//

import Foundation

//Documento que se encarga de Mantener ordenados los APis que se consumen y los dominios a utilizar

struct EndPoints {
    static let Domain = "https://api.mercadolibre.com/"
}

struct URLGet {
    static let Search = "sites/MLC/search?q="
    static let Items = "items/"
    static let Description =  "items/${ItemID}/description"
}
