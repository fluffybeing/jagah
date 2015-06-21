//
//  TPConvenience.swift
//  Tour Da Vida
//
//  Created by Rahul on 6/21/15.
//  Copyright (c) 2015 Housing. All rights reserved.
//

import Foundation

extension TPClient {
    
    // MARK: - GET Convenience Methods
    
    func getPlaces(completionHandler: (result: [TPPlace]?, error: NSError?) -> Void) {
        
        /* 1. Specify parameters, method (if has {key}), and HTTP body (if POST) */
        let parameters = [
            TPClient.ParameterKeys.location: "Berlin",
            TPClient.ParameterKeys.category: "restaurant",
            TPClient.ParameterKeys.name: "La Dolce Vita"
        ]
        
        var mutableMethod : String = Methods.Places
        
        mutableMethod = TPClient.Methods.Places
        
        /* 2. Make the request */
        taskForGETMethod(mutableMethod, parameters: parameters) { JSONResult, error in
            
            /* 3. Send the desired value(s) to completion handler */
            if let error = error {
                completionHandler(result: nil, error: error)
            } else {
                
                if let results = JSONResult as? [[String : AnyObject]] {
                    
                    var movies = TPPlace.placesFromResults(results)
                    
                    completionHandler(result: movies, error: nil)
                } else {
                    completionHandler(result: nil, error: NSError(domain: "getPlaces parsing", code: 0, userInfo: [NSLocalizedDescriptionKey: "Could not parse getPlaces"]))
                }
            }
        }
    }
}