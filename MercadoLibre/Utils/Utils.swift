//
//  Routines.swift
//  MercadoLibre
//
//  Created by Christians Bonilla on 3/06/23.
//

import Foundation

var wasportrait = true

class Utils:NSObject{
    
    func Currency(Number:Int) -> String{
        
        let formatter = NumberFormatter()
        formatter.locale = Locale.current
        formatter.numberStyle = .currency
        if let formattedTipAmount = formatter.string(from: Number as NSNumber) {
            return formattedTipAmount
        }else{
            
            return "$ \(Number)"
            
        }
        
    }
    
}
