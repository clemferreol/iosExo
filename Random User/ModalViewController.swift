//
//  ModalViewController.swift
//  Random User
//
//  Created by Clementine Ferreol on 09/10/2017.
//  Copyright © 2017 Clementine Ferreol. All rights reserved.
//

import UIKit

class ModalViewController: UIViewController {
    var person: Person?
    
   
    
    @IBOutlet weak var Photo: UIImageView!
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var Lastname: UILabel!
    @IBOutlet weak var Firstname: UILabel!
    @IBOutlet weak var Age: UILabel!
    @IBOutlet weak var Email: UILabel!
    @IBOutlet weak var Gender: UILabel!
    
   override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    
    
    UserDefaults.standard.setValue(self.person?.firstname, forKey: "firstname")
    UserDefaults.standard.setValue(self.person?.lastname, forKey: "lastname")
    UserDefaults.standard.setValue(self.person?.birthdate.toString(format: "dd/MM/YYY"), forKey: "age")
    UserDefaults.standard.setValue(self.person?.email.description, forKey: "email")
    UserDefaults.standard.setValue(self.person?.gender.rawValue, forKey: "gender")
    UserDefaults.standard.setValue(self.person?.photo, forKey: "photo")
    print("\(UserDefaults.standard.value(forKey:"photo") ?? "default")") // Enregistrement dans le cache ne marche pas sans ça

    
    
    let url = URL(string: (self.person?.photo)!)
    let data = try? Data(contentsOf: url!)
    Photo.contentMode = .scaleAspectFit
  
    
    Lastname.text = self.person?.lastname
    Firstname.text = self.person?.firstname
    Age.text = self.person?.birthdate.toString(format: "dd/MM/YYYY")
    Email.text = self.person?.email.description
    Photo.image = UIImage(data: data!)
    Gender.text = (self.person?.gender).map { $0.rawValue }
    }
    
    
    
    @IBAction func CloseButton(_ sender: UIButton) {
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
}
