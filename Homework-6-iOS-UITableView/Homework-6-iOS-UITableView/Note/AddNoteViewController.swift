//
//  AddNoteViewController.swift
//  Homework-6-iOS-UITableView
//
//  Created by Alla on 12/14/18.
//  Copyright © 2018 AndreiSavchenko. All rights reserved.
//

import UIKit

class AddNoteViewController: UIViewController {
    @IBOutlet weak var titleTextField: UITextField!
    
    @IBOutlet weak var descriptionTextView: UITextView!
    
    @IBOutlet weak var dateDatePicker: UIDatePicker!
    
    @IBOutlet weak var completedSwitch: UISwitch!
    
    @IBAction func saveBarButtonItem(_ sender: UIBarButtonItem) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

}
