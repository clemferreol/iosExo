//
//  Exercice_3.swift
//  project1
//
//  Created by Clementine Ferreol on 28/09/2017.
//  Copyright © 2017 Clementine Ferreol. All rights reserved.
//

import Foundation

extension Int {
    
    func isValidInch()->Bool {
        return self >= 12 && self <= 27
    }
}

struct Wheel {
    var inch: Int
    var state: State
    
    enum State {
        case Good, Bad
    }
    
    init(inch: Int, state: State){
        
        if(!inch.isValidInch()){
            print("Inch is not valid")
        }
        
        self.inch = inch
        self.state = state
    }
}

class Vehicule {
    
    var fuel: Fuel
    
    var wheels: Array<Wheel>
   
    enum Fuel {
        case Gaz, Essence, Diesel, None
    }
    
    init (fuel: Fuel, wheels: Array<Wheel>){
        self.fuel = fuel
        self.wheels = wheels
    }
}

class Car: Vehicule {
    let name: String
    init(name: String, fuel: Vehicule.Fuel, wheels: Array<Wheel>) {
        self.name = name
        
        if(wheels.count != 4) {
            print("Error car should have 4 wheels")
        }
        super.init(fuel: fuel, wheels: wheels)
    }
}

class Bike: Vehicule {
    let name: String
    init(name: String, fuel: Vehicule.Fuel, wheels: Array<Wheel>) {
        self.name = name
        
        if(wheels.count != 2) {
            print("Error bike should have 4 wheels")
        }
        super.init(fuel: fuel, wheels: wheels)
    }
}



//Car(name: "Clio", fuel: .Essence, wheels: [Wheel(inch: 12, state: .Bad), Wheel(inch: 12, state: .Good)])

//Bike(name: "BMX", fuel: .None, wheels: [Wheel(inch: 12, state: .Bad), Wheel(inch: 12, state: .Good)])
