//
//  Restaurant.swift
//  Resto
//
//  Created by Ludovic Ollagnier on 08/03/2017.
//  Copyright © 2017 Ludovic Ollagnier. All rights reserved.
//

import Foundation

struct Restaurant: Hashable, CustomStringConvertible  {
    
    enum Style {
        case vegan
        case burger
        case takeAway
    }
    
    var name: String
    var address: String
    
    var isVisited: Bool
    var style: Set<Style>
    
    var grade: Int?
    //    var grade: Optional<Int>
    
    var menu: [Menuable]
    
    static func ==(lhs: Restaurant, rhs: Restaurant) -> Bool {
        if rhs.name == lhs.name && rhs.address == lhs.address {
            return true
        }
        return false
    }
    
    var hashValue: Int {
        return (name + address).hashValue
    }
    
    var description: String {
        return "Le resto \(name) est à l'adresse \(address)"
    }
}
