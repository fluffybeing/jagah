//
//  TPConstants.swift
//  Tour Da Vida
//
//  Created by Rahul on 6/21/15.
//  Copyright (c) 2015 Housing. All rights reserved.
//

import Foundation

extension TPClient {
    
    // MARK: - Constants
    struct Constants {
        
        // MARK: URLs
        static let BaseURL : String = "http://tour-pedia.org/api/"
        
    }
    
    // MARK: - Methods
    struct Methods {
        
        // MARK: Places
        static let Places = "getPlaces"
        
        // MARK: Reviews
        static let Reviews = "getReviews"
    }
    
    
    // MARK: - Parameter Keys
    struct ParameterKeys {
        
        static let location = "location"
        static let category = "category"
        static let name = "name"
        static let source = "source"
        static let language = "language"
        static let keyword = "keywords"
        static let minWords = "minWords"
        static let maxWords = "maxWords"
        static let startDate = "startDate"
        static let endDate = "endDate"
        
    }
    
    // MARK: - JSON Response Keys
    struct JSONResponseKeys {
        
        // MARK: General
        static let StatusMessage = "status_message"
        static let StatusCode = "status_code"
        
        // MARK: Places
        static let PlaceAddress = "address"
        static let PlaceCategory = "attraction"
        static let PlaceId = "id"
        static let PlaceLat = "lat"
        static let PlaceLng = "lng"
        static let PlaceLocation = "location"
        static let PlaceName = "name"
        static let PlaceOriginalId = "originalId"
        static let PlacePolarity = "polarity"
        static let PlaceSubCategory = "subCategory"
        static let PlaceDetails = "details"
                
        // MARK: Reviews
        static let ReviewLanguage = "language"
        static let ReviewPolarity = "polarity"
        static let ReviewRating = "rating"
        static let ReviewSource = "source"
        static let ReviewText = "text"
        static let ReviewTime = "time"
        static let ReviewWordsCount = "wordsCount"
        static let ReviewDetails = "details"
    }
    
}