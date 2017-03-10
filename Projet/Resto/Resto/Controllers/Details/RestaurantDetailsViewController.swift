//
//  RestaurantDetailsViewController.swift
//  Resto
//
//  Created by Ludovic Ollagnier on 10/03/2017.
//  Copyright © 2017 Ludovic Ollagnier. All rights reserved.
//

import UIKit
import LocalAuthentication

class RestaurantDetailsViewController: UIViewController {
    
    @IBOutlet weak var restoAdressLabel: UILabel!
    @IBOutlet weak var swiftImageView: UIImageView!
    
    var restaurant: Restaurant?

    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
        verifyUser()

    }

    @IBAction func touchId(_ sender: Any) {
        
        let url = URL(string: "https://developer.apple.com/swift/images/swift-og.png")!
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let image = data {
                let swift = UIImage(data: image)
                print(swift)
                
                DispatchQueue.main.async {
                    self.swiftImageView.image = swift
                }
                
            }
        }
        task.resume()
    }
    
    private func configureUI() {
        
        guard let resto = restaurant else {
            return
        }
        title = resto.name
        restoAdressLabel.text = resto.address
    }
    
    private func verifyUser() {
        let currentContext = LAContext()
        var error: NSError?
        
        guard currentContext.canEvaluatePolicy(.deviceOwnerAuthentication, error: &error) else {
            print(error)
            return
        }
        
        currentContext.evaluatePolicy(.deviceOwnerAuthentication, localizedReason: "Je veux savoir si tu es bien toi") { (authenticated, error) in
            
            guard error == nil else {
                print("probleme")
                return
            }
            
            if authenticated {
                print("super")
            } else {
                print("Tu n'es pas toi")
            }
        }
    }
    
}
