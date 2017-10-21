//
//  Exercice_4.swift
//  Random User
//
//  Created by Clementine Ferreol on 09/10/2017.
//  Copyright © 2017 Clementine Ferreol. All rights reserved.
//

import Foundation

class ApiManager: NSObject {
    
    let baseURL = "https://api.randomuser.me/"
    
    func getRandomUser(completion: @escaping (Any) -> Void) {
        
        var request = URLRequest(url: URL(string: baseURL)!)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { data, response, err in
            
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! [String:Any]
                let results = json["results"] as! NSArray
                completion(results[0])
            } catch let error as NSError {
                print(error)
            }
            
            }.resume()
        
    }
    
}
