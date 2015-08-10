//
//  ViewController.swift
//  Tour Da Vida
//
//  Created by Rahul on 6/21/15.
//  Copyright (c) 2015 Housing. All rights reserved.
//

import UIKit

class PlaceViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    var placeData = PlaceData()
    
    @IBOutlet var collectionView: UICollectionView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
            // Do any additional setup after loading the view, typically from a nib.
            collectionView!.dataSource = self
            collectionView!.delegate = self
        }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        // Navigation controller title update
        self.navigationItem.title = "Home"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // UICollectionView Delegates
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return placeData.entryPlaces.count
    }

    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("PlaceViewCell", forIndexPath: indexPath) as PlaceCollectionViewCell
        // cell.backgroundColor = UIColor.redColor()
        
        let entry = placeData.entryPlaces[indexPath.row]
        cell.placeLabel.text = entry.locationName
        cell.placeImageView.image = UIImage(named: entry.imageFilename)
        
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {

        // Get a categoryController from the Storyboard
        let categoryController = self.storyboard!.instantiateViewControllerWithIdentifier("CategoryViewController") as CategoryViewController
        
        // pass the data
        let entry = placeData.entryPlaces[indexPath.row]
        categoryController.location = entry.locationName
        
        // Push the new controller onto the stack
        self.navigationController!.pushViewController(categoryController, animated: true)
    }
}

// Configure layout
extension PlaceViewController : UICollectionViewDelegateFlowLayout {
    //1
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
            
            return CGSize(width: 140, height: 240)
    }
    
    //2
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,insetForSectionAtIndex section: Int) -> UIEdgeInsets {
            let sectionInsets = UIEdgeInsets(top: 10.0, left: 10.0, bottom: 40.0, right: 10.0)
            return sectionInsets
    }
}
