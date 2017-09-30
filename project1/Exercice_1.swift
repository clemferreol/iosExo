//
//  Exercice_1.swift
//  project1
//
//  Created by Clementine Ferreol on 21/09/2017.
//  Copyright © 2017 Clementine Ferreol. All rights reserved.
//

import Foundation


func condog(str: String, prefix: Character, suffix: String) -> String{
    var strFinal = str
    
    strFinal.insert(prefix, at: strFinal.startIndex)
    strFinal.append(suffix)
    
    return strFinal
}
