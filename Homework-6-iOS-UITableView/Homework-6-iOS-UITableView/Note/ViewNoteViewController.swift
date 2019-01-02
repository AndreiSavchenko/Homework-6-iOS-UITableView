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
    var editNote = Note()
    var editSaveNote: ((Note) -> Void)?
    private let dateFormat = "dd MMM yyyy HH:mm:ss"
    private var dateFormatter = DateFormatter()
    
    func datePicker() -> String {
        dateDatePicker.datePickerMode = UIDatePicker.Mode.date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM yyyy HH:mm:ss"
        let selectedDate = dateFormatter.string(from: dateDatePicker.date)
        return selectedDate
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let rightButton = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(ViewNoteViewController.changeOnSave(_:)))
        self.navigationItem.rightBarButtonItem = rightButton
        
        titleTextField.isUserInteractionEnabled = false
        descriptionTextView.isUserInteractionEnabled = false
        dateDatePicker.isUserInteractionEnabled = false
        completedSwitch.isUserInteractionEnabled = false
        
        titleTextField.text = editNote.title
        descriptionTextView.text = editNote.description
        dateFormatter.dateFormat = dateFormat
        dateDatePicker.date = dateFormatter.date(from: editNote.createdDate)!
        completedSwitch.isOn = editNote.completed
        
        descriptionTextView.layer.borderColor =  UIColor.lightGray.cgColor
        descriptionTextView.layer.borderWidth = 1.0
        descriptionTextView.layer.cornerRadius = 8
    }
    
    @objc func changeOnSave(_ sender: UIBarButtonItem) {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(ViewNoteViewController.saveNote(_:)))
        titleTextField.isUserInteractionEnabled = true
        descriptionTextView.isUserInteractionEnabled = true
        dateDatePicker.isUserInteractionEnabled = true
        completedSwitch.isUserInteractionEnabled = true
    }
    
    @objc func saveNote(_ sender: UIBarButtonItem) {
        print("saveNote Отправляем в Майн через saveNote")
        let editSaveNoteNew = Note.init(title: titleTextField.text!,
                                description: descriptionTextView.text,
                                createdDate: datePicker(),
                                completed: completedSwitch.isOn)
        editSaveNote?(editSaveNoteNew)
        print("saveNote \(editSaveNoteNew)")
        navigationController?.popViewController(animated: true)
    }
    
    
}
