//
//  ReviewViewController.swift
//  Tour Da Vida
//
//  Created by Rahul on 6/21/15.
//  Copyright (c) 2015 Housing. All rights reserved.
//

import Foundation
import UIKit

class ReviewViewController: UITableViewController {
    
    var reviews: [TPReview] = [TPReview]()
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    // MARK: - UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        TPClient.sharedInstance().getReviews {reviews, error in
            if let reviews = reviews {
                self.reviews = reviews
                
                // deactivate the indicator after data loading is complete
                self.activityIndicator.alpha = 0.0
                self.activityIndicator.stopAnimating()
                
                // reload table cell in main thread
                dispatch_async(dispatch_get_main_queue()) {
                    self.tableView.reloadData()
                }

            } else {
                println(error)
            }
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        // start indicator 
        self.activityIndicator.alpha = 1.0
        self.activityIndicator.startAnimating()
    
        
        self.navigationItem.title = "Reviews"
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        
    }
    
    // MARK: - UITableViewController
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reviews.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = self.tableView.dequeueReusableCellWithIdentifier("ReviewViewCell") as! ReviewViewCell
        
        var review = reviews[indexPath.row]
        cell.placeName.text = review.source
        cell.reviewText.text = review.text
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        // Get the selected categories
        let selectedCategories = reviews[indexPath.row]
        
        // Get a reviewController from the Storyboard
        let reviewDetailController = self.storyboard!.instantiateViewControllerWithIdentifier("ReviewDetailViewController") as! ReviewDetailViewController
        
        // Push the new controller onto the stack
        self.navigationController!.pushViewController(reviewDetailController, animated: true)
    }

    
}
