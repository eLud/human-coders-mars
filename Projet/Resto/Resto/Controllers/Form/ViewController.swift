//
//  ViewController.swift
//  Resto
//
//  Created by Ludovic Ollagnier on 07/03/2017.
//  Copyright © 2017 Ludovic Ollagnier. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var noteStackView: UIStackView!
    @IBOutlet weak var noteLabel: UILabel!
    
    var directry = RestaurantDirectory()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func visitedSwitchChanged(_ sender: UISwitch) {
        noteStackView.isHidden = !sender.isOn
    }
    
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        noteLabel.text = "\(sender.value)"
    }
    
    @IBAction func enregistre(_ sender: UIButton) {
        print("toto")
        sender.isEnabled = false
        let name = nameTextField.text
        nameTextField.textColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
    }
    
    var father: Human?

    @IBAction func cancel(_ sender: UIButton) {
        
        var toto = Human(name: "Père", picture: #imageLiteral(resourceName: "pere"))
        father = toto
        var son = Human(name: "Fils", picture: #imageLiteral(resourceName: "son"))
        
        father?.children = son
        son.father = father
    }


}


class Human {
    
    var name: String
    var profilePicture: UIImage
    
    weak var father: Human?
    var children: Human?
    
    init(name: String, picture: UIImage) {
        self.name = name
        self.profilePicture = picture
    }
    
    deinit {
        print("\(name) is dead")
    }
}

















