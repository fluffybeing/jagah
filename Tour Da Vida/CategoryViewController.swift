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
        
        // Navigation controller title update
        self.navigationController?.navigationBar.topItem?.title = "Categories"
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        self.tableView.reloadData()
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
    
    // Helpers
    
    func imageWithBorderForImage(initalImage: UIImage) -> UIImage {
        var borderSize:CGFloat = 5.0
        
        UIGraphicsBeginImageContext(CGSizeMake(initalImage.size.width + borderSize * 2.0, initalImage.size.height + borderSize * 2.0))
        
        initalImage.drawInRect(CGRectMake(borderSize, borderSize, initalImage.size.width, initalImage.size.height))
        let resultedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return resultedImage
    }

}
