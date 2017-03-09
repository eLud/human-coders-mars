//
//  RestaurantDirectory.swift
//  Resto
//
//  Created by Ludovic Ollagnier on 08/03/2017.
//  Copyright © 2017 Ludovic Ollagnier. All rights reserved.
//

import Foundation

class RestaurantDirectory {
    
    static let shared = RestaurantDirectory()
    
    private var directory: [Restaurant]
    
    private init() {
        directory = []
    }
    
    /// This adds a restaurant to the directory
    /// - parameter restaurant
    ///  The restaurant to add
    func add(_ restaurant: Restaurant) {
        directory.append(restaurant)
    }
    
    func list() -> [Restaurant] {
        return directory
    }
    
    func remove(restaurant: Restaurant) {
        
        guard let index = directory.index(of: restaurant) else { return }
        directory.remove(at: index)
    }
    
    func mange(_ aliment: Plat, dans lieu: String = "", avec pote: String = "") {
        
        print("Je mange aliment dans dans")
        print("A", "B", separator: "-", terminator: ",")
    }
}
