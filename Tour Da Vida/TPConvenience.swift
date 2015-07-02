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
        
        var mutableMethod : String = TPClient.Methods.Places
        
        /* 2. Make the request */
        taskForGETMethod(mutableMethod, parameters: parameters) { JSONResult, error in
            
            /* 3. Send the desired value(s) to completion handler */
            if let error = error {
                completionHandler(result: nil, error: error)
            } else {
                
                if let results = JSONResult as? [[String : AnyObject]] {
                    
                    var places = TPPlace.placesFromResults(results)
                    
                    completionHandler(result: places, error: nil)
                } else {
                    completionHandler(result: nil, error: NSError(domain: "getPlaces parsing", code: 0, userInfo: [NSLocalizedDescriptionKey: "Could not parse getPlaces"]))
                }
            }
        }
    }
    
    // MARK: - GET Convenience Methods
    
    func getReviews(location:String, category:String, completionHandler: (result: [TPReview]?, error: NSError?) -> Void) {
        
        // update category parameter
        var modifiedCategoryName:String
        
        if category == "Point Of Interest" {
            modifiedCategoryName = "poi"
        } else {
            modifiedCategoryName = category.lowercaseString
        }
        
        /* 1. Specify parameters, method (if has {key}), and HTTP body (if POST) */
        let parameters = [
            TPClient.ParameterKeys.location: location,
            TPClient.ParameterKeys.category: modifiedCategoryName,
            TPClient.ParameterKeys.language: "en"
        ]
        
        var mutableMethod : String = TPClient.Methods.Reviews
        
        /* 2. Make the request */
        taskForGETMethod(mutableMethod, parameters: parameters) { JSONResult, error in
            
            /* 3. Send the desired value(s) to completion handler */
            if let error = error {
                completionHandler(result: nil, error: error)
            } else {
                
                if let results = JSONResult as? [[String : AnyObject]] {
                    
                    var reviews = TPReview.reviewsFromResults(results)
                    
                    completionHandler(result: reviews, error: nil)
                } else {
                    completionHandler(result: nil, error: NSError(domain: "getReviews parsing", code: 0, userInfo: [NSLocalizedDescriptionKey: "Could not parse getReviews"]))
                }
            }
        }
    }
    
    func getReviewDetails(url:NSURL, completionHandler: (result: AnyObject!, error: NSError?) -> Void) -> NSURLSessionDataTask {
        let request = NSURLRequest(URL: url)
        /* 4. Make the request */
        let task = session.dataTaskWithRequest(request) {data, response, downloadError in
            
            /* 5/6. Parse the data and use the data (happens in completion handler) */
            if let error = downloadError {
                let newError = TPClient.errorForData(data, response: response, error: error)
                completionHandler(result: nil, error: downloadError)
            } else {
                TPClient.parseJSONWithCompletionHandler(data, completionHandler: completionHandler)
            }
        }
        
        /* 7. Start the request */
        task.resume()
        
        return task

    }

}