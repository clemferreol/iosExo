//
//  Exercice_5.swift
//  Random User
//
//  Created by Clementine Ferreol on 09/10/2017.
//  Copyright © 2017 Clementine Ferreol. All rights reserved.
//

import Foundation

extension ApiManager {
    
    func getRandomUserHydratedWithPerson(completion: @escaping (Person) -> Void) {
        
        self.getRandomUser(completion: { data in
            
            let result = data as! [String:Any]
            
            let name = result["name"] as! [String: String]
            let picture = result["picture"] as! [String: String]
            
            if let firstname = name["first"], let lastname = name["last"], let email = result["email"], let medium = picture["medium"], let gender = result["gender"], let birthdate = result["dob"] {
                
                let person = Person(
                    firstname: firstname,
                    lastname: lastname,
                    gender: Person.Gender(rawValue: gender as! String)!,
                    email: email as! String,
                    photo: medium,
                    birthdate: (date: birthdate as! String, format: "yyyy-MM-dd HH:mm:ss")
                )
                
                completion(person)
                
            }
            
        })
        
    }
    
}
