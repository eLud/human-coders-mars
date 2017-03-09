//
//  UIViewExtensions.swift
//  Resto
//
//  Created by Ludovic Ollagnier on 09/03/2017.
//  Copyright © 2017 Ludovic Ollagnier. All rights reserved.
//

import UIKit

extension UIView {
    
    func warn() {
        UIView.animate(withDuration: 0.4, delay: 0, options: [.autoreverse], animations: {
            self.backgroundColor = UIColor.red
        }, completion: nil)
    }
}
