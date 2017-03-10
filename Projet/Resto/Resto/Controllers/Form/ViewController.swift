//
//  ViewController.swift
//  Resto
//
//  Created by Ludovic Ollagnier on 07/03/2017.
//  Copyright © 2017 Ludovic Ollagnier. All rights reserved.
//

import UIKit

enum FormError: Error {
    case textFieldIsEmpty (textField: UITextField)
    case textIsNotLongEnough
    case undefined (view: UIView?)
    case anotherUndefinedError
}

class ViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var noteStackView: UIStackView!
    @IBOutlet weak var noteLabel: UILabel!
    @IBOutlet weak var noteSlider: UISlider!
    @IBOutlet weak var visitedSwitch: UISwitch!
    
    var directory = RestaurantDirectory.shared
    
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
        
        do {
            let resto = try restaurantFromForm()
            directory.add(resto)
            dismiss(animated: true, completion: nil)
        } catch FormError.textFieldIsEmpty (let tf){
            tf.warn()
        } catch FormError.textIsNotLongEnough {
        
        } catch {
            
        }
    }
    
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        
        dismiss(animated: true, completion: nil)
    }
    
    private func restaurantFromForm() throws -> Restaurant {
        
        guard let name = nameTextField.text, !name.isEmpty else {
            throw FormError.textFieldIsEmpty(textField: nameTextField)
        }
// Chainage de guard
//        guard let tf = nameTextField, let name2 = tf.text, !name2.isEmpty else {
//            return nil
//        }
        
        guard let address = addressTextField.text, !address.isEmpty else {
            throw FormError.textFieldIsEmpty(textField: addressTextField)
        }
        
        var note: Int? = nil
        
        if visitedSwitch.isOn {
            note = Int(round(noteSlider.value))
        }
        
        let resto = Restaurant(name: name, address: address, isVisited: visitedSwitch.isOn, style: [], grade: note, menu: [])
        
        return resto
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
    
    func open(file: String) {
        
        // Ouvre le fichier
        
        //Executé en sortie de scope, en FILO si plusieurs déclarés
        defer {
            //ferme le fichier
            toto = "fini"
        }
        
        var toto = ""
        
        guard file.characters.count < 45 else {
            return
        }
        guard file.hasPrefix("") else {
            return
        }
        guard file.hasSuffix("") else {
            return
        }
    }
    
    deinit {
        print("\(name) is dead")
    }
}
