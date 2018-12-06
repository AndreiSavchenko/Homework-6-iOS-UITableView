//
//  CalendarHeaderSectionView.swift
//  Homework-6-iOS-UITableView
//
//  Created by Alla on 12/6/18.
//  Copyright © 2018 AndreiSavchenko. All rights reserved.
//

import UIKit

class SectionHeaderView: UICollectionReusableView {
    @IBOutlet weak var monthsTitleLabel: UILabel!
    
    var monthsTitle: String! {
        didSet {
            monthsTitleLabel.text = monthsTitle
        }
    }
}
