//
//  ProductsViewModel.swift
//  MercadoLibre
//
//  Created by Christians Bonilla on 3/06/23.
//

import Foundation

class ProductsViewModel {
    
    func Product(IdItem:String,completion: @escaping (ProductsModel.ProductsData?)->()){
        
        APIClientProducts().Producto(ItemID: IdItem) { (Response) in
            
            if let Result = Response{
                
                switch Result.result{
                    
                case .success(_):
                    
                    if let data = try?
                        JSONDecoder().decode(ProductsModel.ProductsData.self, from: Result.data!) as ProductsModel.ProductsData {
                        
                        completion(data)
                    }else{
                        
                        completion(nil)
                    }
                case .failure(_):
                    
                    completion(nil)
                }
                
            }else{
                completion(nil)
                
            }
            
        }
    }
    
    func Description(IdItem:String,completion: @escaping (DescriptionModel.DescriptionData?)->()){
        
        APIClientProducts().Description(ItemID: IdItem) { (Response) in
            
            if let Result = Response{
                
                switch Result.result{
                    
                case .success(_):
                    
                    if let data = try?
                        JSONDecoder().decode(DescriptionModel.DescriptionData.self, from: Result.data!) as DescriptionModel.DescriptionData {
                        
                        completion(data)
                    }else{
                        
                        completion(nil)
                    }
                case .failure(_):
                    
                    completion(nil)
                }
                
            }else{
                completion(nil)
                
            }
            
        }
    }
    
}
