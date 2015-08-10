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
    
    var location:String = ""
    
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
        
        var cell = self.tableView.dequeueReusableCellWithIdentifier("CategoryViewCell") as CategoryViewCell
        
        // get the entry object
        let entry = category.entry[indexPath.row]
        
        cell.selectionStyle = UITableViewCellSelectionStyle.Blue
        // Standard options
        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator

        
        cell.categoryName.text = entry.categoryName
        cell.categoryIcon.image = UIImage(named: entry.imageFilename)
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        // Get the selected categories
        let selectedCategory = category.entry[indexPath.row]
        
        // Get a reviewController from the Storyboard
        let reviewController = self.storyboard!.instantiateViewControllerWithIdentifier("ReviewViewController") as ReviewViewController
        
        // pass the date
        reviewController.location = self.location
        reviewController.category = selectedCategory.categoryName

        // Push the new controller onto the stack
        self.navigationController!.pushViewController(reviewController, animated: true)
    }
}
