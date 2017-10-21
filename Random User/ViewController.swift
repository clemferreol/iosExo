//
//  ViewController.swift
//  Random User
//
//  Created by Clementine Ferreol on 09/10/2017.
//  Copyright © 2017 Clementine Ferreol. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let api = ApiManager()
    var person: Person?

    @IBAction func ClearButton(_ sender: UIButton) {
        let bundle = Bundle.main.bundleIdentifier
        UserDefaults.standard.removePersistentDomain(forName: bundle!)
        
        let alert = UIAlertController(title: "Alert", message: "Le cache a bien été vidé !", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Done", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
       
    }
    
    @IBAction func goButtonPressed(_ sender: UIButton) {
        
        if(UserDefaults.standard.value(forKey:"firstname") != nil) {

           let firstname =  UserDefaults.standard.value(forKey: "firstname") as! String
           let lastname = UserDefaults.standard.value(forKey: "lastname") as! String
           let birthdate = UserDefaults.standard.value(forKey: "age") as! String
           let email =  UserDefaults.standard.value(forKey: "email") as! String
           let gender = UserDefaults.standard.value(forKey: "gender") as! String
           let photo = UserDefaults.standard.value(forKey: "photo") as! String

            let person = Person(firstname: firstname, lastname: lastname, gender: Person.Gender(rawValue: gender)!, email: email.description, photo: photo, birthdate: birthdate.toDate(format: "dd/mm/yyyy"))
            
            
            
           self.performSegue(withIdentifier: "ShowModal", sender: person)
            
        }else{
            
            api.getRandomUserHydratedWithPerson(completion: { person in
                
                DispatchQueue.main.async {
                    
                    UserDefaults.standard.setValue(self.person?.firstname, forKey: "firstname")
                    UserDefaults.standard.setValue(self.person?.lastname, forKey: "lastname")
                    UserDefaults.standard.setValue(self.person?.birthdate.toString(format: "dd/MM/YYY"), forKey: "age")
                    UserDefaults.standard.setValue(self.person?.email.description, forKey: "email")
                    UserDefaults.standard.setValue(self.person?.gender.rawValue, forKey: "gender")
                    UserDefaults.standard.setValue(self.person?.photo, forKey: "photo")
                    print("On enregistre dans le cache")
                    
                    self.performSegue(withIdentifier: "ShowModal", sender: person)
                }
            })
        }
    }
    
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if(segue.identifier == "ShowModal") {
        
        let modalViewController = segue.destination as! ModalViewController
        modalViewController.person = sender as! Person

        }
    }
}


