//
//  Exercice_2.swift
//  project1
//
//  Created by Clementine Ferreol on 21/09/2017.
//  Copyright © 2017 Clementine Ferreol. All rights reserved.
//

import Foundation

func cleanHobbits(arr: Array<String>) -> (String, String, Array<String>, Int){
    var array = arr
    
    let first:String = arr[arr.startIndex]
    let second:String = arr[arr.count-1]
    
    array.removeFirst()
    array.removeLast()
    for index in 0...array.count-1 {
        array.insert(array.remove(at: index), at: 0)
    }
    return(first, second, array, array.count)
}




/*
 Créer un fichier “Exercice_2” dans le repertoire “Exercices"
 
 Faire une fonction qui a pour nom "cleanHobbits".
 
 Cette fonction retournera un Tuple.
 
 Cette fonction aura 1 argument:
 (arr) de type "Array" qui sera ["Frodo", "Aragorn", "Boromir", "Legolas", "Gimli", "Gandalf", "Samsaget"]
 
 Votre fonction retournera un Tuple:
 Premier élément de votre array
 Dernier élément de votre array
 Votre array renversé sans le premier et le dernier élément
 Le nombre d'éléments dans votre array renversé
 
 Vous avez l'interdiction d'utiliser la fonction "reversed" pour votre array
 
 
 */
