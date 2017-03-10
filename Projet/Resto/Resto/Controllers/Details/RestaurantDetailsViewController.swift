//
//  RestaurantDetailsViewController.swift
//  Resto
//
//  Created by Ludovic Ollagnier on 10/03/2017.
//  Copyright © 2017 Ludovic Ollagnier. All rights reserved.
//

import UIKit

class RestaurantDetailsViewController: UIViewController {
    
    @IBOutlet weak var restoAdressLabel: UILabel!
    
    var restaurant: Restaurant?

    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
    }

    private func configureUI() {
        
        guard let resto = restaurant else {
            return
        }
        title = resto.name
        restoAdressLabel.text = resto.address
    }
    
}
