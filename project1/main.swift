//
//  main.swift
//  project1
//
//  Created by Clementine Ferreol on 21/09/2017.
//  Copyright © 2017 Clementine Ferreol. All rights reserved.
//

import Foundation

/***** EXERCICE_1 *****/

print(condog(str: "suis", prefix: "y", suffix: "je"))

/***** EXERCICE_2 *****/


print(cleanHobbits(arr:["Frodo", "Aragorn","Boromir", "Legolas","Gimli", "Gandalf", "Samsaget"] ))


/***** EXERCICE_3 *****/

let personne = Person.init(firstname: "Clémentine", lastname: "Ferréol", gender: .Female, email: "cleol@gmail.fr", birthdate: (date: "1992/02/14", format: "YYY/MM/DD"))

let personne2 = Person.init(firstname: "Jade", lastname: "Ferréol", gender: .Female, email: "jadeol@gmail.com", birthdate: "21/02/1989".toDate(format: "DD/MM/YYYY"))

print(personne.show())

print(personne2.show())



/***** EXERCICE_4 *****/


let apiManager = ApiManager.init(baseURL: "https://api.randomuser.me/")
print(apiManager.getRandomUser(completion: {data in
    print(data)
}))



