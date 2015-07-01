//
//  CategoryViewController.swift
//  Tour Da Vida
//
//  Created by Rahul on 6/21/15.
//  Copyright (c) 2015 Housing. All rights reserved.
//

import Foundation
import UIKit

class CategoryViewController: UITableViewController {
    
    var category = CategoryData()
    
    // MARK: - UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        self.tableView.reloadData()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationItem.title = "Categories"
    }
    // MARK: - UITableViewController
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return category.entry.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = self.tableView.dequeueReusableCellWithIdentifier("CategoryViewCell") as! CategoryViewCell
        
        // get the entry object
        let entry = category.entry[indexPath.row]
        cell.categoryName.text = entry.categoryName
        cell.categoryIcon.image = UIImage(named: entry.imageFilename)
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        // Get the selected categories
        let selectedCategories = category.entry[indexPath.row]
        
        // Get a reviewController from the Storyboard
        let reviewController = self.storyboard!.instantiateViewControllerWithIdentifier("ReviewViewController") as! ReviewViewController
        
        // Push the new controller onto the stack
        self.navigationController!.pushViewController(reviewController, animated: true)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!){
        // get the selected index row
        let selectedRow = self.tableView.indexPathForSelectedRow()!
        
        // get the navigation controller
        let navVC = segue.destinationViewController as! UINavigationController
        
        let reviewVC = navVC.viewControllers.first as! ReviewViewController
        
        
    }
    
}
