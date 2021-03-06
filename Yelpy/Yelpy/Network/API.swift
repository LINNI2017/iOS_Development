//
//  File.swift
//  Yelpy
//
//  Created by Memo on 5/21/20.
//  Copyright © 2020 memo. All rights reserved.
//

import Foundation


struct API {
    

    // update escaping to restaurant
    static func getRestaurants(completion: @escaping ([Restaurant]?) -> Void) {
        
        // Add your own API key!
        let apikey = "Dz7jhPza1DIio-Bs8IK7L2bzvTBp7ZP-ghJq8pwI0Mmh0Ev8DWccU6sK86pILzAzo--GYgQrcS0NZmt3bVgMbQgzgk38R2b5H8G5ZgTCG-oJipGlUrMT8pUCIdBvX3Yx"
        
        // Coordinates for San Francisco
        let lat = 37.773972
        let long = -122.431297
        
        
        let url = URL(string: "https://api.yelp.com/v3/transactions/delivery/search?latitude=\(lat)&longitude=\(long)")!
        
        var request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        
        // Insert API Key to request
        request.setValue("Bearer \(apikey)", forHTTPHeaderField: "Authorization")
        
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
            // This will run when the network request returns
            if let error = error {
                print(error.localizedDescription)
            } else if let data = data {

                // Get data from API and return it using completion
//                print(data)
                
                // convert json response to a dictionary
                let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                
                // grab the business data and convert it to an array of dictionaries
                let restDict = dataDictionary["businesses"] as! [[String: Any]]
                
                // store array of restaurants
                var restArray: [Restaurant] = []
                
                // initialize Restaurant object with each restaurant dict
                for dictionary in restDict {
                    let rest = Restaurant.init(dict: dictionary)
                    restArray.append(rest)
                }
                
                // completion is an escaping method
                // it allows the data to be used outside of the closure
                return completion(restArray)
            }
        }
        task.resume()
    }
}

    
