//
//  CategoryEntries.swift
//  Tour Da Vida
//
//  Created by Rahul on 6/21/15.
//  Copyright (c) 2015 Housing. All rights reserved.
//

import Foundation

class CategoryData {
    class Enrty {
        let imageFilename: String
        let categoryName: String
        
        init(imageFilename: String, categoryName: String) {
            self.imageFilename = imageFilename
            self.categoryName = categoryName
        }
    }
    
    let entry = [
        Enrty(imageFilename: "sunbathing.png", categoryName: "Accommodation"),
        Enrty(imageFilename: "heart206.png", categoryName: "Point Of Interest"),
        Enrty(imageFilename: "coconut5.png", categoryName: "Restaurant"),
        Enrty(imageFilename: "castle7.png", categoryName: "Attraction")
    ]
}