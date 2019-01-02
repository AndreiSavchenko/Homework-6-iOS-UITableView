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
    
    var newSaveNote: ((Note) -> Void)?
    
    
    func datePicker() -> String {
        dateDatePicker.datePickerMode = UIDatePicker.Mode.date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM yyyy HH:mm:ss"
        let selectedDate = dateFormatter.string(from: dateDatePicker.date)
        return selectedDate
    }
    
    @IBAction func saveBarButtonItem(_ sender: UIBarButtonItem) {
        let newNote = Note.init(title: titleTextField.text!,
                                description: descriptionTextView.text,
                                createdDate: datePicker(),
                                completed: completedSwitch.isOn)
        newSaveNote?(newNote)
        navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        descriptionTextView.layer.borderColor =  UIColor.lightGray.cgColor
        descriptionTextView.layer.borderWidth = 1.0
        descriptionTextView.layer.cornerRadius = 8
    }
}
