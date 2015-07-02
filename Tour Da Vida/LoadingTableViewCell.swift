//
//  LoadingTableViewCell.swift
//  Tour Da Vida
//
//  Created by Rahul on 7/2/15.
//  Copyright (c) 2015 Housing. All rights reserved.
//

import Foundation
import UIKit

class LoadingTableViewCell: UITableViewCell {
    
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.loadingIndicator.startAnimating()
    }
    
    func startAnimating() {
        self.loadingIndicator.startAnimating()
    }
    
    func stopAnimating() {
        self.loadingIndicator.stopAnimating()
    }
    
}
