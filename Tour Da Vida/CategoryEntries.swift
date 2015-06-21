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
        Enrty(imageFilename: "amsterdam.jpg", categoryName: "Amsterdam"),
        Enrty(imageFilename: "barcelona.jpg", categoryName: "Barcelona"),
        Enrty(imageFilename: "berlin.jpg", categoryName: "Berlin"),
        Enrty(imageFilename: "dubai.jpg", categoryName: "Dubai"),
        Enrty(imageFilename: "london.jpg", categoryName: "London"),
        Enrty(imageFilename: "paris.jpg", categoryName: "Paris"),
        Enrty(imageFilename: "rome.jpg", categoryName: "Rome"),
        Enrty(imageFilename: "tuscany.jpg", categoryName: "Tuscany"),
    ]
}