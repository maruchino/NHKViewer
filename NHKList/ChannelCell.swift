//
//  ChannelCell.swift
//  NHKList
//
//  Created by  intern on 2015/08/20.
//  Copyright (c) 2015年 sonicmoov. All rights reserved.
//


import UIKit

import SDWebImage

class ChannelCell: UITableViewCell {
    
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var startTimeLabel: UILabel!
    @IBOutlet weak var endTimeLabel: UILabel!
    
    var list: ListJSON? {
        didSet {
            titleLabel.text = list?.title
            detailLabel.text = list?.subtitle
            startTimeLabel.text = list?.startTime
            endTimeLabel.text = list?.endTime
           
        }
    }
}

extension Int {
    var decimalFormat: String? {
        get {
            let formatter = NSNumberFormatter()
            formatter.numberStyle = .DecimalStyle
            formatter.groupingSeparator = ","
            formatter.groupingSize = 3
            
            return formatter.stringFromNumber(NSNumber(integer: self))
        }
    }
}

