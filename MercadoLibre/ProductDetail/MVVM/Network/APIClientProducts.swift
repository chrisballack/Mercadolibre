//
//  APIClientProducts.swift
//  MercadoLibre
//
//  Created by Christians Bonilla on 3/06/23.
//

import Foundation
import Alamofire


class APIClientProducts {
    
    func Producto(ItemID:String,completion: @escaping (AFDataResponse<Data>?) -> ()) {
        
        AF.request(EndPoints.Domain+URLGet.Items+ItemID,
                   method: .get).responseData {
            
            (Result) in
            
            completion(Result)
        }
        
    }
    
    func Description(ItemID:String,completion: @escaping (AFDataResponse<Data>?) -> ()) {
        
        AF.request(EndPoints.Domain+URLGet.Description.replacingOccurrences(of: "${ItemID}", with: ItemID),
                   method: .get).responseData {
            
            (Result) in
            
            completion(Result)
        }
        
    }
    
}
