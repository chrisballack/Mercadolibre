//
//  Description.swift
//  MercadoLibre
//
//  Created by Christians Bonilla on 3/06/23.
//

import Foundation

class DescriptionModel{
    
    struct DescriptionData : Codable {
        
        let plain_text : String?
        
        enum CodingKeys: String, CodingKey {
            
            case plain_text = "plain_text"
            
        }
        
        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            plain_text = try values.decodeIfPresent(String.self, forKey: .plain_text)
        }
        
    }
    
}
