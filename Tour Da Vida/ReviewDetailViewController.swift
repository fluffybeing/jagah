//
//  ReviewDetailViewController.swift
//  Tour Da Vida
//
//  Created by Rahul on 6/21/15.
//  Copyright (c) 2015 Housing. All rights reserved.
//

import Foundation
import UIKit

class ReviewDetailViewController: UIViewController, UIScrollViewDelegate {
    
    var reviewDetail: TPReview!
    
    @IBOutlet weak var placeImage: UIImageView!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var placeName: UILabel!
    @IBOutlet weak var reviewText: UILabel!
    @IBOutlet weak var sourceImage: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // display random images
        let randomImage = "Aerial0\(arc4random_uniform(8)).jpg"
        self.placeImage.image = UIImage(named: randomImage)

        // load place name and rating label
        ratingLabel.text = "\(reviewDetail.rating)/10"
        placeName.numberOfLines = 0
        placeName.text = reviewDetail.placeName
        // show review text
        reviewText.numberOfLines = 0
        reviewText.text = reviewDetail.text
        
        println("\(self.reviewDetail.source)")
        // Display review source
        self.sourceImage.image = getSourceIcon(reviewDetail.source)
        dateLabel.text = "\(reviewDetail.reviewTime)" + " ⏎"
        
    }
    
}

extension UIImage{
    
    func alpha(value:CGFloat)->UIImage
    {
        UIGraphicsBeginImageContextWithOptions(self.size, false, 0.0)
        
        var ctx = UIGraphicsGetCurrentContext();
        let area = CGRect(x: 0, y: 0, width: self.size.width, height: self.size.height);
        
        CGContextScaleCTM(ctx, 1, -1);
        CGContextTranslateCTM(ctx, 0, -area.size.height);
        CGContextSetBlendMode(ctx, kCGBlendModeMultiply);
        CGContextSetAlpha(ctx, value);
        CGContextDrawImage(ctx, area, self.CGImage);
        
        var newImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        return newImage;
    }
}
