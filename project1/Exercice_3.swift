//
//  Exercice_3.swift
//  project1
//
//  Created by Clementine Ferreol on 28/09/2017.
//  Copyright © 2017 Clementine Ferreol. All rights reserved.
//

import Foundation

extension String {
    
    func toDate(format: String) -> Date{
        let isoDate = self
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        let date = dateFormatter.date(from: isoDate)!
        
        return date
    
    }
}

extension Date {
    func toString(format: String) -> String {
        let isoDate = self
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        let date = dateFormatter.string(from: isoDate)
        
        return date
        
    }
    
    func getYearDifferenceFrom(date:Date) -> Int {
        return Calendar.current.dateComponents([.year], from: self, to: date).year ?? 0
    }
}

struct Email {
    
    var email: String
    
    func isValid() -> Bool {
        
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: email)
    }
    
    init(email:String){
        
        self.email = email
        
        if(!self.isValid()){
            print("Email is not valid")
        }
    }
}

class Existence {
    var birthdate: Date
    var age: Int
    
    func willProbablyDieSoon() -> Bool {
        if(self.age > 100){
            return true
        }
        else{
            return false
        }
    }
    
    init(birthdate:Date){
        self.birthdate = birthdate
        self.age = birthdate.getYearDifferenceFrom(date: Date())
    }
    
}

class Person: Existence {
    
    var gender: Gender
    var firstname: String
    var lastname: String
    var email: Email
    
    enum Gender {
        case Male, Female, Other
    }
    
    func show() {
        
        print("firstname : \(self.firstname) ")
        print("lastname : \(self.lastname) ")
        
        switch self.gender {
        case .Male:
            print("gender : Male")
        case .Female:
            print("gender : Female")
        case .Other:
            print("gender : Other")
        }
        
        print("email valid : \(self.email.isValid())")
        print("email : \(self.email)")
        
        print("birthdate : \(self.birthdate)")
        print("age : \(self.age)")
        print("will die soon : \(self.willProbablyDieSoon())")
        
    }
    
    init(firstname: String, lastname: String, gender: Gender, email: String, birthdate: (date: String, format: String)) {
        self.firstname = firstname
        self.lastname = lastname
        self.gender = gender
        self.email = Email(email:email)
        super.init(birthdate:birthdate.date.toDate(format: birthdate.format))
    }
    
    init(firstname: String, lastname: String, gender: Gender, email: String, birthdate: Date){
        self.firstname = firstname
        self.lastname = lastname
        self.gender = gender
        self.email = Email(email:email)
        super.init(birthdate:birthdate)
        
    }
    
}

