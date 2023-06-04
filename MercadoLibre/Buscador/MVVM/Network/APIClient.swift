//
//  apiClient.swift
//  MercadoLibre
//
//  Created by Christians Bonilla on 3/06/23.
//

import Foundation
import Alamofire


class APIClientBusquedas {
    
    func Busqueda(Busqueda:String,completion: @escaping (AFDataResponse<Data>?) -> ()) {
        
        AF.request(EndPoints.Domain+URLGet.Search,
                   method: .get, parameters: ["q":Busqueda],
                   encoding: URLEncoding(destination: .queryString)).responseData {
            
            (Result) in
            
            completion(Result)
        }
        
    }
    
}
