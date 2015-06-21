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
    
    var reviews = ["one", "two", "three", "four", "Five", "Six"]
    
    // MARK: - UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        self.tableView.reloadData()
    }
    
    // MARK: - UITableViewController
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reviews.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = self.tableView.dequeueReusableCellWithIdentifier("ReviewViewCell") as! UITableViewCell
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
