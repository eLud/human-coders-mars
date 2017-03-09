//
//  RestaurantCollectionViewCell.swift
//  Resto
//
//  Created by Ludovic Ollagnier on 09/03/2017.
//  Copyright © 2017 Ludovic Ollagnier. All rights reserved.
//

import UIKit

class RestaurantCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var styleLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    
    func configureCell(with restaurant: Restaurant) {
        nameLabel.text = restaurant.name
        addressLabel.text = restaurant.address
        
        let styles = restaurant.style.map({ (style) -> String in
            return style.rawValue
        })
        
        styleLabel.text = styles.joined(separator: ", ")
    }
}
