//
//  Dessert.swift
//  Resto
//
//  Created by Ludovic Ollagnier on 08/03/2017.
//  Copyright © 2017 Ludovic Ollagnier. All rights reserved.
//

import Foundation

struct Dessert: Menuable {
    
    let name: String
    let details: String
    var price: Float
    
    let calories: Int
    
    var priceSEK: Float {
        get {
            return price * 120
        }
        
        set(newPrice) {
            price = newPrice / 120
        }
    }
    
    static var usdEurRate: Float = 1.2
}
