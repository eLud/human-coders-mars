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
    @IBOutlet weak var noteSlider: UISlider!
    @IBOutlet weak var visitedSwitch: UISwitch!
    
    var directory = RestaurantDirectory()
    
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
        let note = Int(round(sender.value))
        noteLabel.text = "\(note)"
    }
    
    @IBAction func enregistre(_ sender: UIButton) {
        guard let name = nameTextField.text, !name.isEmpty else {
            return
        }
        guard let address = addressTextField.text, !address.isEmpty else {
            return
        }
        
        var note: Int? = nil
            
        if visitedSwitch.isOn {
            note = Int(round(noteSlider.value))
        }
        
        let resto = Restaurant(name: name, address: address, isVisited: visitedSwitch.isOn, style: [], grade: note, menu: [])
        
        directory.add(resto)

    }
    
    @IBAction func cancel(_ sender: UIButton) {
    
    }
    
    fileprivate var father: Human?
    
    private func memoryLeakExample() {
        var toto = Human(name: "Père", picture: #imageLiteral(resourceName: "pere"))
        father = toto
        var son = Human(name: "Fils", picture: #imageLiteral(resourceName: "son"))
        
        father?.children = son
        son.father = father
    }
}

fileprivate class Human {
    
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
