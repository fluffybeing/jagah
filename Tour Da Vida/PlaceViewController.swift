//
//  ViewController.swift
//  Tour Da Vida
//
//  Created by Rahul on 6/21/15.
//  Copyright (c) 2015 Housing. All rights reserved.
//

import UIKit

class PlaceViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    var placesData: [String] = ["Amsterdam", "Barcelona", "Berlin", "Dubai", "London", "Paris", "Rome", "Tuscany"]
    var placeImages: [String] = ["amsterdam.jpg", "barcelona.jpg", "berlin.jpg", "dubai.jpg", "london.jpg", "paris.jpg", "rome.jpg", "tuscany.jpg"]
    
    var places: [TPPlace] = [TPPlace]()
    
    @IBOutlet var collectionView: UICollectionView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        collectionView!.dataSource = self
        collectionView!.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // UICollectionView Delegates
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return placesData.count
    }

    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("PlaceViewCell", forIndexPath: indexPath) as! PlaceCollectionViewCell
        // cell.backgroundColor = UIColor.redColor()
        cell.placeLabel.text = placesData[indexPath.row]
        cell.placeImageView.image = UIImage(named: placeImages[indexPath.row])
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        println("Selected this Cell \(placesData[indexPath.row])")
        
//        This was for some testing purpose
//        TPClient.sharedInstance().getPlaces {places, error in
//            if let places = places {
//                self.places = places
//                println(places)
//            } else {
//                println(error)
//            }
//        }
    }
}

// Configure layout
extension PlaceViewController : UICollectionViewDelegateFlowLayout {
    //1
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
            
            return CGSize(width: 140, height: 240)
    }
    
    //3
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,insetForSectionAtIndex section: Int) -> UIEdgeInsets {
            let sectionInsets = UIEdgeInsets(top: 20.0, left: 10.0, bottom: 50.0, right: 10.0)
            return sectionInsets
    }
}
