//
//  Exercice_4.swift
//  project1
//
//  Created by Clementine Ferreol on 30/09/2017.
//  Copyright © 2017 Clementine Ferreol. All rights reserved.
//

import Foundation


class ApiManager {
    
    var baseURL: String
    
    init(baseURL: String) {
        self.baseURL = baseURL
    }
    
    func getRandomUser(completion: @escaping (Any) -> Void) {
        
        var request = URLRequest(url: URL(string: self.baseURL)!)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { data, response, err in
            
            do {
                print(1)
                completion(data!)
            } catch let error as NSError {
                print(error)
            }
            
            }.resume()
        
    }
}
    

    

 
 /*func getRandomUser(completion: @escaping (Any) -> Void) {
 let request = URL(string: self.baseURL)
 if let url = request {
 let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
 print(data)
 if error != nil {
 print(error ?? "error")
 } else {
 print(1)
 if let usableData = data {
 let json = try? JSONSerialization.jsonObject(with: usableData, options: [])
 completion(json!)
 print(json)
 
 }
 }
 }
 task.resume()
 }
 }*/
