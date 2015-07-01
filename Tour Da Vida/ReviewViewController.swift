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
    var placeName:String = "Berlin"
    
    //write this in your class
    var isSorted:Bool = false

    
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
        
        var sortButton : UIBarButtonItem = UIBarButtonItem(title: "Sort", style: UIBarButtonItemStyle.Plain, target: self, action: "timeFilterList")
        self.navigationItem.rightBarButtonItem = sortButton
       
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
       
       // show the placename, date, review snippet and humanize time
       cell.placeName.text = self.placeName
       cell.reviewSnippet.text = review.text
       cell.placeIcon.image = UIImage(named: "badge-place")
       cell.reviewIcon.image = UIImage(named: "comment")
       
       // humanize time
       let timeAgo = dateFromString(review.reviewTime, "yyyy-MM-dd'T'HH:mm:ssZ")
       cell.reviewDate.text = timeAgoSinceDate(timeAgo, true)
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        // Get the selected categories
        // let selectedCategories = reviews[indexPath.row]
        
        // Get a reviewController from the Storyboard
        let reviewDetailController = self.storyboard!.instantiateViewControllerWithIdentifier("ReviewDetailViewController") as! ReviewDetailViewController
        
        // Push the new controller onto the stack
        self.navigationController!.pushViewController(reviewDetailController, animated: true)
    }
    
    func timeFilterList() {
        print("Filter got called")
        if isSorted == false {
            // should probably be called sort and not filter
            // sort the  reviews by date
            reviews.sort() { dateFromString($0.reviewTime, "yyyy-MM-dd").compare(dateFromString($1.reviewTime, "yyyy-MM-dd")) == NSComparisonResult.OrderedAscending }
            isSorted = true
        } else {
            reviews.sort() { dateFromString($0.reviewTime, "yyyy-MM-dd").compare(dateFromString($1.reviewTime, "yyyy-MM-dd")) == NSComparisonResult.OrderedDescending }
            isSorted = false
            
        }

    self.tableView.reloadData(); // notify the table view the data has changed
    }
        
}
