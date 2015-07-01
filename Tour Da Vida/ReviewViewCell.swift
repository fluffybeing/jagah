//
//  ReviewViewCell.swift
//  Tour Da Vida
//
//  Created by Rahul on 6/22/15.
//  Copyright (c) 2015 Housing. All rights reserved.
//

import UIKit
import Foundation

class ReviewViewCell: UITableViewCell {
    
    @IBOutlet weak var reviewSnippet: UILabel!
    @IBOutlet weak var placeName: UILabel!
    @IBOutlet weak var reviewDate: UILabel!
    @IBOutlet weak var placeIcon: UIImageView!
    @IBOutlet weak var reviewIcon: UIImageView!
}



public func resizeImage(image:UIImage, toTheSize size:CGSize)->UIImage{
    
    
    var scale = CGFloat(max(size.width/image.size.width,
        size.height/image.size.height))
    var width:CGFloat  = image.size.width * scale
    var height:CGFloat = image.size.height * scale;
    
    var rr:CGRect = CGRectMake( 0, 0, width, height);
    
    UIGraphicsBeginImageContextWithOptions(size, false, 0);
    image.drawInRect(rr)
    let newImage = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext();
    return newImage
}

extension UILabel {
    func resizeHeightToFit(heightConstraint: NSLayoutConstraint) {
        let attributes = [NSFontAttributeName : font]
        numberOfLines = 2
        lineBreakMode = NSLineBreakMode.ByWordWrapping
        let rect = text!.boundingRectWithSize(CGSizeMake(frame.size.width, CGFloat.max), options: NSStringDrawingOptions.UsesLineFragmentOrigin, attributes: attributes, context: nil)
        heightConstraint.constant = rect.height
        setNeedsLayout()
    }
}

// date formatter
public func stringFromDate(date: NSDate, format: String) -> String {
    let dateFormatter = NSDateFormatter()
    dateFormatter.dateFormat = format
    return dateFormatter.stringFromDate(date)
}

public func dateFromString(date: String, format: String) -> NSDate {
    let dateFormatter = NSDateFormatter()
    dateFormatter.dateFormat = format
    if let date = dateFormatter.dateFromString(date) {
        return date
    } else {
        return NSDate(timeIntervalSince1970: 0)
    }
}

public func timeAgoSinceDate(date:NSDate, numericDates:Bool) -> String {
    let calendar = NSCalendar.currentCalendar()
    let unitFlags = NSCalendarUnit.CalendarUnitMinute | NSCalendarUnit.CalendarUnitHour | NSCalendarUnit.CalendarUnitDay | NSCalendarUnit.CalendarUnitWeekOfYear | NSCalendarUnit.CalendarUnitMonth | NSCalendarUnit.CalendarUnitYear | NSCalendarUnit.CalendarUnitSecond
    let now = NSDate()
    let earliest = now.earlierDate(date)
    let latest = now.laterDate(date)
    let components:NSDateComponents = calendar.components(unitFlags, fromDate: earliest, toDate: latest, options: nil)
    
    if (components.year >= 2) {
        return "\(components.year)y"
    } else if (components.year >= 1){
        if (numericDates){
            return "1y"
        } else {
            return "1y"
        }
    } else if (components.month >= 2) {
        return "\(components.month * 4)w"
    } else if (components.month >= 1){
        if (numericDates){
            return "4w"
        } else {
            return "4w"
        }
    } else if (components.weekOfYear >= 2) {
        return "\(components.weekOfYear)w"
    } else if (components.weekOfYear >= 1){
        if (numericDates){
            return "1w"
        } else {
            return "1w"
        }
    } else if (components.day >= 2) {
        return "\(components.day)d"
    } else if (components.day >= 1){
        if (numericDates){
            return "1d"
        } else {
            return "1d"
        }
    } else if (components.hour >= 2) {
        return "\(components.hour)h"
    } else if (components.hour >= 1){
        if (numericDates){
            return "1h"
        } else {
            return "1h"
        }
    } else if (components.minute >= 2) {
        return "\(components.minute)m"
    } else if (components.minute >= 1){
        if (numericDates){
            return "1m"
        } else {
            return "1m"
        }
    } else if (components.second >= 3) {
        return "\(components.second)s"
    } else {
        return "now"
    }
    
}
