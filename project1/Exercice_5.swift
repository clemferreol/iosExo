//
//  Exercice_5.swift
//  project1
//
//  Created by Clementine Ferreol on 30/09/2017.
//  Copyright © 2017 Clementine Ferreol. All rights reserved.
//

import Foundation

extension ApiManager {
    func getRandomUserHydratedWithPerson(completion: @escaping (Person) -> Void){
        let api = ApiManager.init(baseURL:  "https://api.randomuser.me/")
        
        api.getRandomUser(completion: { data in
            let result = data as! [String:Any]
            let name = result["name"] as! String
            let person =
        
        })
    }
}
