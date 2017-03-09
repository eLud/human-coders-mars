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
        let originalColor = self.backgroundColor
        UIView.animateKeyframes(withDuration: 1, delay: 0, options: [], animations: {
            
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.25, animations: {
                self.backgroundColor = UIColor.red
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.25, relativeDuration: 0.25, animations: {
                self.backgroundColor = originalColor
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.25, animations: {
                self.backgroundColor = UIColor.red
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.75, relativeDuration: 0.25, animations: {
                self.backgroundColor = originalColor
            })
            
        }, completion: nil)
    }
}
