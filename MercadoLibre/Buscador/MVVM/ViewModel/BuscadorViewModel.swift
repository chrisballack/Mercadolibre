//
//  BuscadorViewModel.swift
//  MercadoLibre
//
//  Created by Maria Fernanda Paz Rodriguez on 3/06/23.
//

import Foundation

class BuscadorViewModel {
    func Busqueda(Busqueda:String,completion: @escaping (BuscadorModel.BuscadorData?)->()){
        
        MELIAPIClient().Busqueda(Busqueda: Busqueda) { (Response) in
            
            if let Result = Response{
                
                switch Result.result{
                    
                case .success(_):
                    if let data = try?
                        JSONDecoder().decode(BuscadorModel.BuscadorData.self, from: Result.data!) as BuscadorModel.BuscadorData {
                        
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
