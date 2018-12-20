//
//  ViewNoteViewController.swift
//  Homework-6-iOS-UITableView
//
//  Created by Alla on 12/20/18.
//  Copyright © 2018 AndreiSavchenko. All rights reserved.
//

import UIKit

class ViewNoteViewController: UIViewController {

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var dateDatePicker: UIDatePicker!
    @IBOutlet weak var completedSwitch: UISwitch!
    
    var editNote = Note(title: " ", description: " ", createdDate: " ", completed: false)
    
    func configureView() {
        // Update the user interface for the detail item.
  
        
        if let detail = detailItem {
            if let textField = titleTextField {
                textField.text = detail.description
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        configureView()
    }
    
    var detailItem: UITextField? {
        didSet {
            // Update the view.
            configureView()
        }
    }
    
}
