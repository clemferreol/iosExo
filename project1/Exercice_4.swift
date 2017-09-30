//
//  Exercice_4.swift
//  project1
//
//  Created by Clementine Ferreol on 30/09/2017.
//  Copyright © 2017 Clementine Ferreol. All rights reserved.
//

import Foundation


class ApiManager {
    
    init(baseURL: String) {
        self.baseURL = baseURL
    }
    
    var baseURL: String
    
    func getRandomUser(completion: @escaping (Any) -> Void) {
        let urlString = URL(string: self.baseURL)
        if let url = urlString {
            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print(error ?? "error")
                } else {
                    if let usableData = data {
                        let json = try? JSONSerialization.jsonObject(with: usableData, options: [])
                        completion(json!)
                        print(json)
                    }
                }
            }
            task.resume()
        }
    }
}
    
    
    /*v
    
 
 
 
 
 
 func getRandomUser(completion: @escaping (Any) -> Void) {
 let urlString = URL(string: self.baseURL)
 if let url = urlString {
 let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
 if error != nil {
 print(error ?? "error")
 } else {
 if let usableData = data {
 let json = try? JSONSerialization.jsonObject(with: usableData, options: [])
 completion(json!)
 }
 }
 }
 task.resume()
 }
 
 
 
 
 func callbackLogic(country: String, completion: @escaping (Any) -> Void) -> String {
 
 var request = URLRequest(url: URL(string: "https://restcountries.eu/rest/v2/alpha/\(country)")!)
 request.httpMethod = "GET"
 
 URLSession.shared.dataTask(with: request) { data, response, err in
 
 do {
 completion(data!)
 } catch let error as NSError {
 print(error)
 }
 
 }.resume()
 
 }*/
