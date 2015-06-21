//
//  SupportedPlacesData.swift
//  Tour Da Vida
//
//  Created by Rahul on 6/21/15.
//  Copyright (c) 2015 Housing. All rights reserved.
//

import Foundation

class PlaceData {
    class Enrty {
        let imageFilename: String
        let locationName: String
        
        init(imageFilename: String, locationName: String) {
            self.imageFilename = imageFilename
            self.locationName = locationName
        }
    }
    
    let entryPlaces = [
        Enrty(imageFilename: "amsterdam.jpg", locationName: "Amsterdam"),
        Enrty(imageFilename: "barcelona.jpg", locationName: "Barcelona"),
        Enrty(imageFilename: "berlin.jpg", locationName: "Berlin"),
        Enrty(imageFilename: "dubai.jpg", locationName: "Dubai"),
        Enrty(imageFilename: "london.jpg", locationName: "London"),
        Enrty(imageFilename: "paris.jpg", locationName: "Paris"),
        Enrty(imageFilename: "rome.jpg", locationName: "Rome"),
        Enrty(imageFilename: "tuscany.jpg", locationName: "Tuscany"),
    ]
}