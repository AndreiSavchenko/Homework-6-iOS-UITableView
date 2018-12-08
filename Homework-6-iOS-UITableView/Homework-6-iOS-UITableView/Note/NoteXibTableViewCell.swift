//
//  NoteXibTableViewCell.swift
//  Homework-6-iOS-UITableView
//
//  Created by Alla on 12/3/18.
//  Copyright © 2018 AndreiSavchenko. All rights reserved.
//

import UIKit

class NoteXibTableViewCell: UITableViewCell {
    static let reuseIdentifier: String = "MyNoteSell"
    
    @IBOutlet weak var myTitleCellTextField: UITextField!
    @IBOutlet weak var myDateLabel: UILabel!
    @IBOutlet weak var myDescriptionLabel: UILabel!
    
    }
