//
//  ReviewViewController.swift
//  Tour Da Vida
//
//  Created by Rahul on 6/21/15.
//  Copyright (c) 2015 Housing. All rights reserved.
//

import Foundation
import UIKit

class ReviewViewController: UITableViewController, UISearchBarDelegate, UITableViewDataSource,UISearchDisplayDelegate {
    
    // searchBar for anagram searching
    @IBOutlet weak var searchBar: UISearchBar!
    var searchActive : Bool = false
    
    var reviews = [TPReview]()
    var filteredReviews = [TPReview]()
    
    // get place details
    var reviewDetailData:TPReviewDetail?
    var detailReviews = [TPReviewDetail]()
    
    // this values is coming from selected cell
    var location:String = ""
    var category:String = ""
    
    //write this in your class
    var isSorted:Bool = false

    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    // MARK: - UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()

        TPClient.sharedInstance().getReviews(self.location, category: self.category, completionHandler: {reviews, error in
            if let reviews = reviews {
                self.reviews = reviews
                
                // reload table cell in main thread
                dispatch_async(dispatch_get_main_queue()) {
                    self.tableView.reloadData()
                }

                // stop indicator
                self.activityIndicator.alpha = 0.0
                self.activityIndicator.stopAnimating()

            } else {
                println(error)
            }
        })
        
        // sort button
        var sortButton = UIBarButtonItem(image: UIImage(named: "sort"), style: UIBarButtonItemStyle.Done, target: self, action: "timeFilterList")
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
    
    // MARK: Search Bar
    
    func searchBarTextDidBeginEditing(searchBar: UISearchBar) {
        searchActive = true;
    }
    
    func searchBarTextDidEndEditing(searchBar: UISearchBar) {
        searchActive = false;
    }
    
    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
        searchActive = false;
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        searchActive = false;
    }

    func filterContentForSearchText(searchText: String) {
        // Filter the array using the filter method
        self.filteredReviews = reviews.filter({( review: TPReview) -> Bool in
            let reviewStringMatch = review.text.rangeOfString(searchText, options: NSStringCompareOptions.CaseInsensitiveSearch)
            let nameStringMatch = review.source.rangeOfString(searchText, options: NSStringCompareOptions.CaseInsensitiveSearch)
            return reviewStringMatch != nil || nameStringMatch != nil
        })
    }
    
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        self.filterContentForSearchText(searchText)
        
        if(filteredReviews.count == 0){
            searchActive = false;
        } else {
            searchActive = true;
        }
        // reload table cell in main thread
        self.tableView.reloadData()
        
    }


    // MARK: - UITableViewController
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if(searchActive) {
            return  self.filteredReviews.count
        }
        return reviews.count
        
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    
        var cell = self.tableView.dequeueReusableCellWithIdentifier("ReviewViewCell") as! ReviewViewCell
        
        // declare reviws data
        let review:TPReview!
        
        if(searchActive){
            review = filteredReviews[indexPath.row]
        } else {
            review = reviews[indexPath.row]
        }
       
        // get 10 words of review text
        var reviewSnippet = split(review.text){$0 == " "}
        if reviewSnippet.count > 10 {
            cell.reviewSnippet.text = " ".join(Array(reviewSnippet[0...10]))
        } else {
            cell.reviewSnippet.text = " ".join(reviewSnippet)
        }
        
        // get url of detail review
        var reviewURL = NSURL(string: review.detailURL)!
        TPClient.sharedInstance().getReviewDetails(reviewURL, completionHandler: {JSONResult, error in
            
            if let data = JSONResult as? [String:AnyObject] {
                // println(data["place"])
                self.reviewDetailData = TPReviewDetail.reviewDetailFromResults(data["place"]! as! [String : AnyObject])
                // reload table cell in main thread
                dispatch_async(dispatch_get_main_queue()) {
                    cell.placeName.text = self.reviewDetailData?.name
                }
                
                // add all the data to array
                self.reviews[indexPath.row].placeName = self.reviewDetailData?.name
            } else {
                println(error)
            }
        })

       // show the placename, date, review snippet and humanize time
       cell.placeIcon.image = getSourceIcon(review.source)
       cell.reviewIcon.image = UIImage(named: "comment")
       
       // humanize time
       let timeAgo = dateFromString(review.reviewTime, "yyyy-MM-dd")
       cell.reviewDate.text = timeAgoSinceDate(timeAgo, true)
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        // Get the selected categories
        // declare reviws data
        let reviewDetailCell:TPReview!
        
        if(searchActive){
            reviewDetailCell = filteredReviews[indexPath.row]
        } else {
            reviewDetailCell = reviews[indexPath.row]
        }
        
        // Get a reviewController from the Storyboard
        let reviewDetailController = self.storyboard!.instantiateViewControllerWithIdentifier("ReviewDetailViewController") as! ReviewDetailViewController
        
        // pass the data to next view
        reviewDetailController.reviewDetail = reviewDetailCell
        
        // Push the new controller onto the stack
        self.navigationController!.pushViewController(reviewDetailController, animated: true)
    }
    
    func timeFilterList() {
        
        // toggle the sort function
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

// Helpers
public func getSourceIcon(source:String) -> UIImage {
    if source == "Foursquare" {
        return UIImage(named: "foursquare")!
    } else if source == "Facebook" {
        return UIImage(named: "facebook")!
    } else if source == "Booking" {
        return UIImage(named: "booking")!
    } else {
        return UIImage(named: "google")!
    }
}

