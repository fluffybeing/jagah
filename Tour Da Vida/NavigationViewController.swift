//
//  NavigationViewController.swift
//  Tour Da Vida
//
//  Created by Rahul on 7/3/15.
//  Copyright (c) 2015 Housing. All rights reserved.
//

import Foundation

import UIKit

class NavigationController: UINavigationController, UIViewControllerTransitioningDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Status bar white font
        self.navigationBar.barStyle = UIBarStyle.Black
        self.navigationBar.tintColor = UIColor.whiteColor()
    }
}
