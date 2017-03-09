//
//  Menuable.swift
//  Resto
//
//  Created by Ludovic Ollagnier on 08/03/2017.
//  Copyright © 2017 Ludovic Ollagnier. All rights reserved.
//

import Foundation

protocol Menuable {
    var name: String { get }
    var details: String { get }
    var price: Float { get set }
    
    var priceUSD: Float { get }
    var priceSEK: Float { get }
    
    static var usdEurRate: Float { get }
}

extension Menuable {
    
    var priceUSD: Float {
        return price * Self.usdEurRate
    }
    
    static var usdEurRate: Float {
        return 1.2
    }
    
    var priceSEK: Float {
        get {
            return price * 100
        }
        
        set(newPrice) {
            price = newPrice / 100
        }
    }
}
