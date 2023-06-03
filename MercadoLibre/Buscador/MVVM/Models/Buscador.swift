//
//  Buscador.swift
//  MercadoLibre
//
//  Created by Maria Fernanda Paz Rodriguez on 3/06/23.
//

import Foundation

class BuscadorModel{
    
    struct BuscadorData : Codable {
        let site_id : String?
        let country_default_time_zone : String?
        let query : String?
        let paging : Paging?
        let results : [Results]?
        let sort : Sort?
        let available_sorts : [Available_sorts]?
        let filters : [Filters]?
        let available_filters : [Available_filters]?

        enum CodingKeys: String, CodingKey {

            case site_id = "site_id"
            case country_default_time_zone = "country_default_time_zone"
            case query = "query"
            case paging = "paging"
            case results = "results"
            case sort = "sort"
            case available_sorts = "available_sorts"
            case filters = "filters"
            case available_filters = "available_filters"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            site_id = try values.decodeIfPresent(String.self, forKey: .site_id)
            country_default_time_zone = try values.decodeIfPresent(String.self, forKey: .country_default_time_zone)
            query = try values.decodeIfPresent(String.self, forKey: .query)
            paging = try values.decodeIfPresent(Paging.self, forKey: .paging)
            results = try values.decodeIfPresent([Results].self, forKey: .results)
            sort = try values.decodeIfPresent(Sort.self, forKey: .sort)
            available_sorts = try values.decodeIfPresent([Available_sorts].self, forKey: .available_sorts)
            filters = try values.decodeIfPresent([Filters].self, forKey: .filters)
            available_filters = try values.decodeIfPresent([Available_filters].self, forKey: .available_filters)
        }

    }

    struct Paging : Codable {
        let total : Int?
        let primary_results : Int?
        let offset : Int?
        let limit : Int?

        enum CodingKeys: String, CodingKey {

            case total = "total"
            case primary_results = "primary_results"
            case offset = "offset"
            case limit = "limit"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            total = try values.decodeIfPresent(Int.self, forKey: .total)
            primary_results = try values.decodeIfPresent(Int.self, forKey: .primary_results)
            offset = try values.decodeIfPresent(Int.self, forKey: .offset)
            limit = try values.decodeIfPresent(Int.self, forKey: .limit)
        }

    }

    struct Results : Codable {
        let id : String?
        let title : String?
        let condition : String?
        let thumbnail_id : String?
        let catalog_product_id : String?
        let listing_type_id : String?
        let permalink : String?
        let buying_mode : String?
        let site_id : String?
        let category_id : String?
        let domain_id : String?
        let thumbnail : String?
        let currency_id : String?
        let order_backend : Int?
        let price : Int?
        let sold_quantity : Int?
        let available_quantity : Int?
        let use_thumbnail_id : Bool?
        let accepts_mercadopago : Bool?
        let tags : [String]?
        let variation_filters : [String]?
        let shipping : Shipping?
        let stop_time : String?
        let seller : Seller?
        let seller_address : Seller_address?
        let address : Address?
        let attributes : [Attributes]?
        
        let installments : Installments?
        
        let promotions : [String]?

        enum CodingKeys: String, CodingKey {

            case id = "id"
            case title = "title"
            case condition = "condition"
            case thumbnail_id = "thumbnail_id"
            case catalog_product_id = "catalog_product_id"
            case listing_type_id = "listing_type_id"
            case permalink = "permalink"
            case buying_mode = "buying_mode"
            case site_id = "site_id"
            case category_id = "category_id"
            case domain_id = "domain_id"
            case thumbnail = "thumbnail"
            case currency_id = "currency_id"
            case order_backend = "order_backend"
            case price = "price"
            case sold_quantity = "sold_quantity"
            case available_quantity = "available_quantity"
            case use_thumbnail_id = "use_thumbnail_id"
            case accepts_mercadopago = "accepts_mercadopago"
            case tags = "tags"
            case variation_filters = "variation_filters"
            case shipping = "shipping"
            case stop_time = "stop_time"
            case seller = "seller"
            case seller_address = "seller_address"
            case address = "address"
            case attributes = "attributes"
            case installments = "installments"
            
            case promotions = "promotions"
            
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            id = try values.decodeIfPresent(String.self, forKey: .id)
            title = try values.decodeIfPresent(String.self, forKey: .title)
            condition = try values.decodeIfPresent(String.self, forKey: .condition)
            thumbnail_id = try values.decodeIfPresent(String.self, forKey: .thumbnail_id)
            catalog_product_id = try values.decodeIfPresent(String.self, forKey: .catalog_product_id)
            listing_type_id = try values.decodeIfPresent(String.self, forKey: .listing_type_id)
            permalink = try values.decodeIfPresent(String.self, forKey: .permalink)
            buying_mode = try values.decodeIfPresent(String.self, forKey: .buying_mode)
            site_id = try values.decodeIfPresent(String.self, forKey: .site_id)
            category_id = try values.decodeIfPresent(String.self, forKey: .category_id)
            domain_id = try values.decodeIfPresent(String.self, forKey: .domain_id)
            thumbnail = try values.decodeIfPresent(String.self, forKey: .thumbnail)
            currency_id = try values.decodeIfPresent(String.self, forKey: .currency_id)
            order_backend = try values.decodeIfPresent(Int.self, forKey: .order_backend)
            price = try values.decodeIfPresent(Int.self, forKey: .price)
            sold_quantity = try values.decodeIfPresent(Int.self, forKey: .sold_quantity)
            available_quantity = try values.decodeIfPresent(Int.self, forKey: .available_quantity)
            use_thumbnail_id = try values.decodeIfPresent(Bool.self, forKey: .use_thumbnail_id)
            accepts_mercadopago = try values.decodeIfPresent(Bool.self, forKey: .accepts_mercadopago)
            tags = try values.decodeIfPresent([String].self, forKey: .tags)
            variation_filters = try values.decodeIfPresent([String].self, forKey: .variation_filters)
            shipping = try values.decodeIfPresent(Shipping.self, forKey: .shipping)
            do{
                
                stop_time = try values.decodeIfPresent(String.self, forKey: .stop_time)
                
            }catch{
                
                stop_time = ""
                
            }
            
            seller = try values.decodeIfPresent(Seller.self, forKey: .seller)
            seller_address = try values.decodeIfPresent(Seller_address.self, forKey: .seller_address)
            address = try values.decodeIfPresent(Address.self, forKey: .address)
            attributes = try values.decodeIfPresent([Attributes].self, forKey: .attributes)
            
            installments = try values.decodeIfPresent(Installments.self, forKey: .installments)
            
            promotions = try values.decodeIfPresent([String].self, forKey: .promotions)
        }

    }

    struct Sort : Codable {
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
    
    struct Available_sorts : Codable {
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

    struct Filters : Codable {
        let id : String?
        let name : String?
        let type : String?
        let valuesMELI : [Values]?

        enum CodingKeys: String, CodingKey {

            case id = "id"
            case name = "name"
            case type = "type"
            case valuesMELI = "values"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            id = try values.decodeIfPresent(String.self, forKey: .id)
            name = try values.decodeIfPresent(String.self, forKey: .name)
            type = try values.decodeIfPresent(String.self, forKey: .type)
            valuesMELI = try values.decodeIfPresent([Values].self, forKey: .valuesMELI)
        }

    }

    struct Available_filters : Codable {
        let id : String?
        let name : String?
        let type : String?
        let valuesMELI : [Values]?

        enum CodingKeys: String, CodingKey {

            case id = "id"
            case name = "name"
            case type = "type"
            case valuesMELI = "values"
        }

        init(from decoder: Decoder) throws {
            var values = try decoder.container(keyedBy: CodingKeys.self)
            id = try values.decodeIfPresent(String.self, forKey: .id)
            name = try values.decodeIfPresent(String.self, forKey: .name)
            type = try values.decodeIfPresent(String.self, forKey: .type)
            valuesMELI = try values.decodeIfPresent([Values].self, forKey: .valuesMELI)
        }

    }
    
    struct Shipping : Codable {
        let store_pick_up : Bool?
        let free_shipping : Bool?
        let logistic_type : String?
        let mode : String?
        let tags : [String]?

        enum CodingKeys: String, CodingKey {

            case store_pick_up = "store_pick_up"
            case free_shipping = "free_shipping"
            case logistic_type = "logistic_type"
            case mode = "mode"
            case tags = "tags"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            store_pick_up = try values.decodeIfPresent(Bool.self, forKey: .store_pick_up)
            free_shipping = try values.decodeIfPresent(Bool.self, forKey: .free_shipping)
            logistic_type = try values.decodeIfPresent(String.self, forKey: .logistic_type)
            mode = try values.decodeIfPresent(String.self, forKey: .mode)
            tags = try values.decodeIfPresent([String].self, forKey: .tags)
        }

    }
    struct Seller : Codable {
        let id : Int?
        let nickname : String?
        let car_dealer : Bool?
        let real_estate_agency : Bool?
        let registration_date : String?
        let tags : [String]?
        let car_dealer_logo : String?
        let permalink : String?
        let seller_reputation : Seller_reputation?
        let eshop : Eshop?

        enum CodingKeys: String, CodingKey {

            case id = "id"
            case nickname = "nickname"
            case car_dealer = "car_dealer"
            case real_estate_agency = "real_estate_agency"
            case registration_date = "registration_date"
            case tags = "tags"
            case car_dealer_logo = "car_dealer_logo"
            case permalink = "permalink"
            case seller_reputation = "seller_reputation"
            case eshop = "eshop"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            id = try values.decodeIfPresent(Int.self, forKey: .id)
            nickname = try values.decodeIfPresent(String.self, forKey: .nickname)
            car_dealer = try values.decodeIfPresent(Bool.self, forKey: .car_dealer)
            real_estate_agency = try values.decodeIfPresent(Bool.self, forKey: .real_estate_agency)
            registration_date = try values.decodeIfPresent(String.self, forKey: .registration_date)
            tags = try values.decodeIfPresent([String].self, forKey: .tags)
            car_dealer_logo = try values.decodeIfPresent(String.self, forKey: .car_dealer_logo)
            permalink = try values.decodeIfPresent(String.self, forKey: .permalink)
            seller_reputation = try values.decodeIfPresent(Seller_reputation.self, forKey: .seller_reputation)
            eshop = try values.decodeIfPresent(Eshop.self, forKey: .eshop)
        }

    }

    struct Seller_address : Codable {
        let comment : String?
        let address_line : String?
        let id : String?
        let latitude : String?
        let longitude : String?
        let country : Country?
        let state : State?
        let city : City?

        enum CodingKeys: String, CodingKey {

            case comment = "comment"
            case address_line = "address_line"
            case id = "id"
            case latitude = "latitude"
            case longitude = "longitude"
            case country = "country"
            case state = "state"
            case city = "city"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            comment = try values.decodeIfPresent(String.self, forKey: .comment)
            address_line = try values.decodeIfPresent(String.self, forKey: .address_line)
            id = try values.decodeIfPresent(String.self, forKey: .id)
            latitude = try values.decodeIfPresent(String.self, forKey: .latitude)
            longitude = try values.decodeIfPresent(String.self, forKey: .longitude)
            country = try values.decodeIfPresent(Country.self, forKey: .country)
            state = try values.decodeIfPresent(State.self, forKey: .state)
            city = try values.decodeIfPresent(City.self, forKey: .city)
        }

    }
    struct Address : Codable {
        let state_id : String?
        let state_name : String?
        let city_id : String?
        let city_name : String?

        enum CodingKeys: String, CodingKey {

            case state_id = "state_id"
            case state_name = "state_name"
            case city_id = "city_id"
            case city_name = "city_name"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            state_id = try values.decodeIfPresent(String.self, forKey: .state_id)
            state_name = try values.decodeIfPresent(String.self, forKey: .state_name)
            city_id = try values.decodeIfPresent(String.self, forKey: .city_id)
            city_name = try values.decodeIfPresent(String.self, forKey: .city_name)
        }

    }

    struct Installments : Codable {
        let quantity : Int?
        let amount : Double?
        let rate : Int?
        let currency_id : String?

        enum CodingKeys: String, CodingKey {

            case quantity = "quantity"
            case amount = "amount"
            case rate = "rate"
            case currency_id = "currency_id"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            quantity = try values.decodeIfPresent(Int.self, forKey: .quantity)
            amount = try values.decodeIfPresent(Double.self, forKey: .amount)
            rate = try values.decodeIfPresent(Int.self, forKey: .rate)
            currency_id = try values.decodeIfPresent(String.self, forKey: .currency_id)
        }

    }

    struct Attributes : Codable {
        let id : String?
        let name : String?
        let value_id : String?
        let value_name : String?
        let attribute_group_id : String?
        let attribute_group_name : String?
        let value_struct : String?
        let valuesMELI : [Values]?
        let source : Int?
        let value_type : String?

        enum CodingKeys: String, CodingKey {

            case id = "id"
            case name = "name"
            case value_id = "value_id"
            case value_name = "value_name"
            case attribute_group_id = "attribute_group_id"
            case attribute_group_name = "attribute_group_name"
            case value_struct = "value_struct"
            case valuesMELI = "values"
            case source = "source"
            case value_type = "value_type"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            id = try values.decodeIfPresent(String.self, forKey: .id)
            name = try values.decodeIfPresent(String.self, forKey: .name)
            value_id = try values.decodeIfPresent(String.self, forKey: .value_id)
            value_name = try values.decodeIfPresent(String.self, forKey: .value_name)
            attribute_group_id = try values.decodeIfPresent(String.self, forKey: .attribute_group_id)
            
            
            do{
                attribute_group_name = try values.decodeIfPresent(String.self, forKey: .attribute_group_name)
                
            }catch{
                
                attribute_group_name = ""
                
            }
            
            do{
                value_struct = try values.decodeIfPresent(String.self, forKey: .value_struct)
                
            }catch{
                
                value_struct = ""
                
            }
            
            do {
                
                valuesMELI = try values.decodeIfPresent([Values].self, forKey: .valuesMELI)
                
            }catch{
                
                valuesMELI = []
                
            }
            
            do{
                source = try values.decodeIfPresent(Int.self, forKey: .source)
                
            }catch{
                
                source = -1
                
            }
            
            
            value_type = try values.decodeIfPresent(String.self, forKey: .value_type)
        }

    }

    struct Values : Codable {
        let id : String?
        let name : String?
        let results : Int?

        enum CodingKeys: String, CodingKey {

            case id = "id"
            case name = "name"
            case results = "results"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            id = try values.decodeIfPresent(String.self, forKey: .id)
            name = try values.decodeIfPresent(String.self, forKey: .name)
            results = try values.decodeIfPresent(Int.self, forKey: .results)
        }

    }
    
    struct Country : Codable {
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

    struct State : Codable {
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

    struct Seller_reputation : Codable {
        let level_id : String?
        let power_seller_status : String?
        let transactions : Transactions?
        let metrics : Metrics?

        enum CodingKeys: String, CodingKey {

            case level_id = "level_id"
            case power_seller_status = "power_seller_status"
            case transactions = "transactions"
            case metrics = "metrics"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            level_id = try values.decodeIfPresent(String.self, forKey: .level_id)
            power_seller_status = try values.decodeIfPresent(String.self, forKey: .power_seller_status)
            transactions = try values.decodeIfPresent(Transactions.self, forKey: .transactions)
            metrics = try values.decodeIfPresent(Metrics.self, forKey: .metrics)
        }

    }

    struct Eshop : Codable {
        let eshop_id : Int?
        let seller : Int?
        let nick_name : String?
        let eshop_status_id : Int?
        let site_id : String?
        let eshop_experience : Int?
        let eshop_locations : [String]?
        let eshop_logo_url : String?

        enum CodingKeys: String, CodingKey {

            case eshop_id = "eshop_id"
            case seller = "seller"
            case nick_name = "nick_name"
            case eshop_status_id = "eshop_status_id"
            case site_id = "site_id"
            case eshop_experience = "eshop_experience"
            case eshop_locations = "eshop_locations"
            case eshop_logo_url = "eshop_logo_url"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            eshop_id = try values.decodeIfPresent(Int.self, forKey: .eshop_id)
            seller = try values.decodeIfPresent(Int.self, forKey: .seller)
            nick_name = try values.decodeIfPresent(String.self, forKey: .nick_name)
            eshop_status_id = try values.decodeIfPresent(Int.self, forKey: .eshop_status_id)
            
            do{
                site_id = try values.decodeIfPresent(String.self, forKey: .site_id)
                
            }catch{
                site_id = "MLC"
            }
            
            do{
                eshop_experience = try values.decodeIfPresent(Int.self, forKey: .eshop_experience)
                
            }catch{
                eshop_experience = -1
            }
            
            do{
                eshop_locations = try values.decodeIfPresent([String].self, forKey: .eshop_locations)
                
            }catch{
                eshop_locations = []
            }
            
            eshop_logo_url = try values.decodeIfPresent(String.self, forKey: .eshop_logo_url)
        }

    }

    struct City : Codable {
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
    
    struct Transactions : Codable {
        let canceled : Int?
        let completed : Int?
        let period : String?
        let ratings : Ratings?
        let total : Int?

        enum CodingKeys: String, CodingKey {

            case canceled = "canceled"
            case completed = "completed"
            case period = "period"
            case ratings = "ratings"
            case total = "total"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            canceled = try values.decodeIfPresent(Int.self, forKey: .canceled)
            completed = try values.decodeIfPresent(Int.self, forKey: .completed)
            period = try values.decodeIfPresent(String.self, forKey: .period)
            ratings = try values.decodeIfPresent(Ratings.self, forKey: .ratings)
            total = try values.decodeIfPresent(Int.self, forKey: .total)
        }

    }

    struct Ratings : Codable {
        let negative : Double?
        let neutral : Double?
        let positive : Double?

        enum CodingKeys: String, CodingKey {

            case negative = "negative"
            case neutral = "neutral"
            case positive = "positive"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            do{
                negative = try values.decodeIfPresent(Double.self, forKey: .negative)
                
            }catch{
                negative = 0.0
                
            }
            
            do{
                neutral = try values.decodeIfPresent(Double.self, forKey: .neutral)
                
            }catch{
                neutral = 0.0
                
            }
            
            do{
                positive = try values.decodeIfPresent(Double.self, forKey: .positive)
                
            }catch{
                positive = 0.0
                
            }
            
            
        }

    }

    struct Metrics : Codable {
        let sales : Sales?
        let claims : Claims?
        let delayed_handling_time : Delayed_handling_time?
        let cancellations : Cancellations?

        enum CodingKeys: String, CodingKey {

            case sales = "sales"
            case claims = "claims"
            case delayed_handling_time = "delayed_handling_time"
            case cancellations = "cancellations"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            sales = try values.decodeIfPresent(Sales.self, forKey: .sales)
            claims = try values.decodeIfPresent(Claims.self, forKey: .claims)
            delayed_handling_time = try values.decodeIfPresent(Delayed_handling_time.self, forKey: .delayed_handling_time)
            cancellations = try values.decodeIfPresent(Cancellations.self, forKey: .cancellations)
        }

    }

    struct Claims : Codable {
        let period : String?
        let rate : Double?
        let value : Int?

        enum CodingKeys: String, CodingKey {

            case period = "period"
            case rate = "rate"
            case value = "value"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            period = try values.decodeIfPresent(String.self, forKey: .period)
            rate = try values.decodeIfPresent(Double.self, forKey: .rate)
            value = try values.decodeIfPresent(Int.self, forKey: .value)
        }

    }

    struct Sales : Codable {
        let period : String?
        let completed : Int?

        enum CodingKeys: String, CodingKey {

            case period = "period"
            case completed = "completed"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            period = try values.decodeIfPresent(String.self, forKey: .period)
            completed = try values.decodeIfPresent(Int.self, forKey: .completed)
        }

    }

    struct Delayed_handling_time : Codable {
        let period : String?
        let rate : Double?
        let value : Int?

        enum CodingKeys: String, CodingKey {

            case period = "period"
            case rate = "rate"
            case value = "value"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            period = try values.decodeIfPresent(String.self, forKey: .period)
            rate = try values.decodeIfPresent(Double.self, forKey: .rate)
            value = try values.decodeIfPresent(Int.self, forKey: .value)
        }

    }
    
    
    struct Cancellations : Codable {
        let period : String?
        let rate : Double?
        let value : Int?

        enum CodingKeys: String, CodingKey {

            case period = "period"
            case rate = "rate"
            case value = "value"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            period = try values.decodeIfPresent(String.self, forKey: .period)
            rate = try values.decodeIfPresent(Double.self, forKey: .rate)
            value = try values.decodeIfPresent(Int.self, forKey: .value)
        }

    }


}
