//
//  TPPlace.swift
//  Tour Da Vida
//
//  Created by Rahul on 6/21/15.
//  Copyright (c) 2015 Housing. All rights reserved.
//

import Foundation

struct TPPlace {
    
    var name = ""
    var id = 0
    var address = ""
    
    /* Construct a TPPlace from a dictionary */
    init(dictionary: [String : AnyObject]) {
        
        name = dictionary[TPClient.JSONResponseKeys.PlaceName] as! String
        id = dictionary[TPClient.JSONResponseKeys.PlaceId] as! Int
        address = dictionary[TPClient.JSONResponseKeys.PlaceAddress] as! String
    
    }
    
    /* Helper: Given an array of dictionaries, convert them to an array of TPPlace objects */
    static func placesFromResults(results: [[String : AnyObject]]) -> [TPPlace] {
        var places = [TPPlace]()
        
        for result in results {
            places.append(TPPlace(dictionary: result))
        }
        
        return places
    }
}



