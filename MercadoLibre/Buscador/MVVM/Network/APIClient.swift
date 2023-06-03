//
//  apiClient.swift
//  MercadoLibre
//
//  Created by Maria Fernanda Paz Rodriguez on 3/06/23.
//

import Foundation
import Alamofire


class MELIAPIClient {
    
    func Busqueda(Busqueda:String,completion: @escaping (AFDataResponse<Data>?) -> ()) {
        
        
        AF.request(EndPoints.Domain+URLGet.Search + Busqueda, method: .get, encoding: JSONEncoding.default).responseData {
            
            (Result) in
            
            completion(Result)
        }
        
    }
    
}
