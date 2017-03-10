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
//        demoData()
    }
    
    /// This adds a restaurant to the directory
    /// - parameter restaurant
    ///  The restaurant to add
    func add(_ restaurant: Restaurant) {
        
        directory.append(restaurant)
        
        // Notifier les controleurs
        let notCenter = NotificationCenter.default
        notCenter.post(name: NSNotification.Name(Constants.Notifications.modelUpdated), object: self)
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
    
    private func demoData() {
        
        for i in 0...100 {
            let r = Restaurant(name: "Resto \(i)", address: "Adresse \(i)", isVisited: (i%2==0 ? (true):(false)), style: [Restaurant.Style.burger, Restaurant.Style.vegan], grade: (i%2==0 ? (4):(nil)), menu: [])
            add(r)
        }
    }
    
    typealias listnerClosure = (String) -> Void
    
    var tab: [listnerClosure] = []
    func toto(callback: @escaping listnerClosure) {
        
        tab.append(callback)
    }
}
