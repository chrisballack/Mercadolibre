//
//  ModelProducs.swift
//  MercadoLibre
//
//  Created by Christians Bonilla on 3/06/23.
//

import Foundation

class ProductsModel{
    
    struct ProductsData : Codable {
        let id : String?
        let site_id : String?
        let title : String?
        let subtitle : String?
        let seller_id : Int?
        let category_id : String?
        let price : Int?
        let base_price : Int?
        let original_price : Int?
        let currency_id : String?
        let initial_quantity : Int?
        let available_quantity : Int?
        let sold_quantity : Int?
        let sale_terms : [Sale_terms]?
        let buying_mode : String?
        let listing_type_id : String?
        let start_time : String?
        let stop_time : String?
        let condition : String?
        let permalink : String?
        let thumbnail_id : String?
        let thumbnail : String?
        let secure_thumbnail : String?
        var pictures : [Pictures]? = []
        let video_id : String?
        let descriptions : [String]?
        let accepts_mercadopago : Bool?
        
        
        enum CodingKeys: String, CodingKey {

            case id = "id"
            case site_id = "site_id"
            case title = "title"
            case subtitle = "subtitle"
            case seller_id = "seller_id"
            case category_id = "category_id"
            case price = "price"
            case base_price = "base_price"
            case original_price = "original_price"
            case currency_id = "currency_id"
            case initial_quantity = "initial_quantity"
            case available_quantity = "available_quantity"
            case sold_quantity = "sold_quantity"
            case sale_terms = "sale_terms"
            case buying_mode = "buying_mode"
            case listing_type_id = "listing_type_id"
            case start_time = "start_time"
            case stop_time = "stop_time"
            case condition = "condition"
            case permalink = "permalink"
            case thumbnail_id = "thumbnail_id"
            case thumbnail = "thumbnail"
            case secure_thumbnail = "secure_thumbnail"
            case pictures = "pictures"
            case video_id = "video_id"
            case descriptions = "descriptions"
            case accepts_mercadopago = "accepts_mercadopago"
            
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            id = try values.decodeIfPresent(String.self, forKey: .id)
            site_id = try values.decodeIfPresent(String.self, forKey: .site_id)
            title = try values.decodeIfPresent(String.self, forKey: .title)
            subtitle = try values.decodeIfPresent(String.self, forKey: .subtitle)
            seller_id = try values.decodeIfPresent(Int.self, forKey: .seller_id)
            category_id = try values.decodeIfPresent(String.self, forKey: .category_id)
            price = try values.decodeIfPresent(Int.self, forKey: .price)
            base_price = try values.decodeIfPresent(Int.self, forKey: .base_price)
            original_price = try values.decodeIfPresent(Int.self, forKey: .original_price)
            currency_id = try values.decodeIfPresent(String.self, forKey: .currency_id)
            initial_quantity = try values.decodeIfPresent(Int.self, forKey: .initial_quantity)
            available_quantity = try values.decodeIfPresent(Int.self, forKey: .available_quantity)
            sold_quantity = try values.decodeIfPresent(Int.self, forKey: .sold_quantity)
            sale_terms = try values.decodeIfPresent([Sale_terms].self, forKey: .sale_terms)
            buying_mode = try values.decodeIfPresent(String.self, forKey: .buying_mode)
            listing_type_id = try values.decodeIfPresent(String.self, forKey: .listing_type_id)
            start_time = try values.decodeIfPresent(String.self, forKey: .start_time)
            stop_time = try values.decodeIfPresent(String.self, forKey: .stop_time)
            condition = try values.decodeIfPresent(String.self, forKey: .condition)
            permalink = try values.decodeIfPresent(String.self, forKey: .permalink)
            thumbnail_id = try values.decodeIfPresent(String.self, forKey: .thumbnail_id)
            thumbnail = try values.decodeIfPresent(String.self, forKey: .thumbnail)
            secure_thumbnail = try values.decodeIfPresent(String.self, forKey: .secure_thumbnail)
            pictures = try values.decodeIfPresent([Pictures].self, forKey: .pictures)
            video_id = try values.decodeIfPresent(String.self, forKey: .video_id)
            descriptions = try values.decodeIfPresent([String].self, forKey: .descriptions)
            accepts_mercadopago = try values.decodeIfPresent(Bool.self, forKey: .accepts_mercadopago)
            
            
        }

    }

    struct Pictures : Codable {
        let id : String?
        let url : String?
        let secure_url : String?
        let size : String?
        let max_size : String?
        let quality : String?

        enum CodingKeys: String, CodingKey {

            case id = "id"
            case url = "url"
            case secure_url = "secure_url"
            case size = "size"
            case max_size = "max_size"
            case quality = "quality"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            id = try values.decodeIfPresent(String.self, forKey: .id)
            url = try values.decodeIfPresent(String.self, forKey: .url)
            secure_url = try values.decodeIfPresent(String.self, forKey: .secure_url)
            size = try values.decodeIfPresent(String.self, forKey: .size)
            max_size = try values.decodeIfPresent(String.self, forKey: .max_size)
            quality = try values.decodeIfPresent(String.self, forKey: .quality)
        }

    }

    
    struct Sale_terms : Codable {
        let id : String?
        let name : String?
        let value_id : String?
        let value_name : String?
        let value_struct : Value_struct?
        let values : [Values]?
        let value_type : String?

        enum CodingKeys: String, CodingKey {

            case id = "id"
            case name = "name"
            case value_id = "value_id"
            case value_name = "value_name"
            case value_struct = "value_struct"
            case values = "values"
            case value_type = "value_type"
        }

        init(from decoder: Decoder) throws {
            let values1 = try decoder.container(keyedBy: CodingKeys.self)
            id = try values1.decodeIfPresent(String.self, forKey: .id)
            name = try values1.decodeIfPresent(String.self, forKey: .name)
            value_id = try values1.decodeIfPresent(String.self, forKey: .value_id)
            value_name = try values1.decodeIfPresent(String.self, forKey: .value_name)
            value_struct = try values1.decodeIfPresent(Value_struct.self, forKey: .value_struct)
            values = try values1.decodeIfPresent([Values].self, forKey: .values)
            value_type = try values1.decodeIfPresent(String.self, forKey: .value_type)
        }

    }


    struct Values : Codable {
        let id : String?
        let name : String?
        

        enum CodingKeys: String, CodingKey {

            case id = "id"
            case name = "name"
            
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            id = try values.decodeIfPresent(String.self, forKey: .id)
            name = try values.decodeIfPresent(String.self, forKey: .name)
            
        }

    }
    
    struct Value_struct : Codable {
        let number : Int?
        let unit : String?

        enum CodingKeys: String, CodingKey {

            case number = "number"
            case unit = "unit"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            number = try values.decodeIfPresent(Int.self, forKey: .number)
            unit = try values.decodeIfPresent(String.self, forKey: .unit)
        }

    }


    
}
