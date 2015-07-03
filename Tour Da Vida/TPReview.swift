//
//  TPReviews.swift
//  Tour Da Vida
//
//  Created by Rahul on 6/21/15.
//  Copyright (c) 2015 Housing. All rights reserved.
//

import Foundation

struct TPReview {
    
    var text:String = ""
    var rating:Int = 0
    var reviewTime:String
    var source:String
    var wordCount:Int
    var detailURL:String
    
    /* Construct a TPPlace from a dictionary */
    init(dictionary: [String : AnyObject]) {
        
        // rating = dictionary[TPClient.JSONResponseKeys.ReviewRating] as! Int
        source = dictionary[TPClient.JSONResponseKeys.ReviewSource] as! String
        text = dictionary[TPClient.JSONResponseKeys.ReviewText] as! String
        reviewTime = dictionary[TPClient.JSONResponseKeys.ReviewTime] as! String
        wordCount = dictionary[TPClient.JSONResponseKeys.ReviewWordsCount] as! Int
        detailURL = dictionary[TPClient.JSONResponseKeys.ReviewDetails] as! String
        
    }
    
    /* Helper: Given an array of dictionaries, convert them to an array of TPReview objects */
    static func reviewsFromResults(results: [[String : AnyObject]]) -> [TPReview] {
        var reviews = [TPReview]()
        
        
        // limit the result to 20
        for result in results {
            reviews.append(TPReview(dictionary: result))
        }
        return Array(reviews[0...20])
    }
}


struct TPReviewDetail {
    
    var category:String
    var id:Int = 0
    var location:String
    var name:String
    
    
    /* Construct a TPPlace from a dictionary */
    init(dictionary: [String : AnyObject]) {
        
        // rating = dictionary[TPClient.JSONResponseKeys.ReviewRating] as! Int
        category = dictionary[TPClient.JSONResponseKeys.PlaceCategory] as! String
        location = dictionary[TPClient.JSONResponseKeys.PlaceLocation] as! String
        name = dictionary[TPClient.JSONResponseKeys.PlaceName] as! String
        id = dictionary[TPClient.JSONResponseKeys.PlaceId] as! Int
    }
    
    /* Helper: Given an array of dictionaries, convert them to an array of TPReview objects */
    static func reviewDetailFromResults(result: [String : AnyObject]) -> TPReviewDetail {
        return TPReviewDetail(dictionary: result)
    }
}
