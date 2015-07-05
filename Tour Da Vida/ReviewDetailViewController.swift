//
//  ReviewDetailViewController.swift
//  Tour Da Vida
//
//  Created by Rahul on 6/21/15.
//  Copyright (c) 2015 Housing. All rights reserved.
//

import Foundation
import UIKit

class ReviewDetailViewController: UIViewController, UIScrollViewDelegate{
    
    @IBOutlet weak var placeImage: UIImageView!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var placeName: UILabel!
    @IBOutlet weak var reviewText: UILabel!
    @IBOutlet weak var sourceImage: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        let randomImage = "Aerial0\(arc4random_uniform(8)).jpg"
        placeImage.image = UIImage(named: randomImage)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // load place name and rating label
        ratingLabel.text = "4.5/10"
        
        placeName.numberOfLines = 0
        placeName.text = "Van Dor Arabmeia Money is not"
        
        // show review text
        reviewText.numberOfLines = 0
        reviewText.text = "Wow, ok, the problem is exactly this, if I go to the interface builder and select the view controller and try to connect the outlet available, the scroller don't appear"
        sourceImage.image = UIImage(named: "facebook")
        dateLabel.text = "13-10-2015" + " ⏎"
        
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
