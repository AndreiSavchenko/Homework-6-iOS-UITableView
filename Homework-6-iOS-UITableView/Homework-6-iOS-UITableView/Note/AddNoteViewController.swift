//
//  AddNoteViewController.swift
//  Homework-6-iOS-UITableView
//
//  Created by Alla on 12/14/18.
//  Copyright © 2018 AndreiSavchenko. All rights reserved.
//

import UIKit

class AddNoteViewController: UIViewController {
    var newNote: Note?
    
    @IBOutlet weak var titleTextField: UITextField!
    
    @IBOutlet weak var descriptionTextView: UITextView!
    
    @IBOutlet weak var dateDatePicker: UIDatePicker!
    
    @IBOutlet weak var completedSwitch: UISwitch!
    
    
    
    func datePicker() -> String {
        dateDatePicker.datePickerMode = UIDatePicker.Mode.date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM yyyy"
        let selectedDate = dateFormatter.string(from: dateDatePicker.date)
        return selectedDate
    }
    
    @IBAction func goBackToOneButtonTapped(_ sender: Any) {
        performSegue(withIdentifier: "unwindToTableNoteVC", sender: self)
//        print("11111111111111sender")
    }
    
    @IBAction func saveBarButtonItem(_ sender: UIBarButtonItem) {
        newNote = Note.init(title: titleTextField.text!,
                            description: descriptionTextView.text,
                            createdDate: datePicker(),
                            completed: completedSwitch.isOn)
        print(newNote as Any)
        navigationController?.popToRootViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        descriptionTextView.layer.borderColor =  UIColor.lightGray.cgColor
        descriptionTextView.layer.borderWidth = 1.0
        descriptionTextView.layer.cornerRadius = 8
        
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "toMain" {
//            let controller = (segue.destination as? UINavigationController)?.topViewController as? TableNoteViewController
//            controller?.newNoteArr[]
//        }
//    }
}
