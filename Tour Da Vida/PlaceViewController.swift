//
//  ViewController.swift
//  Tour Da Vida
//
//  Created by Rahul on 6/21/15.
//  Copyright (c) 2015 Housing. All rights reserved.
//

import UIKit

class PlaceViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    var placesData: [String] = ["Amsterdam", "Barcelona", "Berlin", "Dubay", "London", "Paris", "Rome", "Tuscany"]
    var placeImages: [String] = ["amsterdam.jpg"]
    
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
        cell.placeImageView.image = UIImage(named: placeImages[0])
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        println("Selected this Cell \(placesData[indexPath.row])")
        
        TPClient.sharedInstance().getPlaces {places, error in
            if let places = places {
                self.places = places
                println(places)
            } else {
                println(error)
            }
        }
    }
}

