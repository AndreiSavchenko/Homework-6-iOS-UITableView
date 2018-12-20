//
//  ViewController.swift
//  Homework-6-iOS-UITableView
//
//  Created by Alla on 12/1/18.
//  Copyright © 2018 AndreiSavchenko. All rights reserved.
//

import UIKit

class TableNoteViewController: UIViewController {
    
    let sectionNote: [String] = ["New", "Completed"]
    @IBOutlet weak var noteTableView: UITableView!
    var newNoteArr: [Note] = []
    var selectedNoteArr = [Note]()
    
    
    //var newNoteForArr = Note.init(completed: false)
    var allNewNote: [Note] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("---viewDidLoad начало---------------")
        print("allNewNote.count) = \(allNewNote.count)")
        print("newNoteArr = \(newNoteArr)")
        print("newNoteArr.count = \(newNoteArr.count)")
        let indexAllNewNote: Int = allNewNote.count-1
        
        if indexAllNewNote >= 0 {
            if allNewNote[indexAllNewNote].completed {
                let indexSelected = selectedNoteArr.count
                selectedNoteArr.insert(allNewNote[indexAllNewNote], at: indexSelected)
            } else {
                let indexNew = 0//newNoteArr.count
                print("---перед инсерт---------------")
                print("allNewNote.count) = \(allNewNote.count)")
                print("newNoteArr = \(newNoteArr)")
                print("newNoteArr.count = \(newNoteArr.count)")
                newNoteArr.insert(allNewNote[indexAllNewNote], at: indexNew)
                print("---после инсерт---------------")
                print("allNewNote.count) = \(allNewNote.count)")
                print("newNoteArr = \(newNoteArr)")
                print("newNoteArr.count = \(newNoteArr.count)")
            }
        }
        
        
        let cellNib = UINib(nibName: "NoteXibTableViewCell", bundle: nil)
        noteTableView.register(cellNib, forCellReuseIdentifier: NoteXibTableViewCell.reuseIdentifier)
        noteTableView.reloadData()
        print("---viewDidLoad конец, после селла----------------")
        print("allNewNote.count) = \(allNewNote.count)")
        print("newNoteArr = \(newNoteArr)")
        print("newNoteArr.count = \(newNoteArr.count)")
        
    }
}

// MARK: - UITableViewDataSource

extension TableNoteViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            print("---33333---------------")
            print("newNoteArr = \(newNoteArr)")
            return newNoteArr.count
        } else {
            return selectedNoteArr.count
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let labelSection = UILabel()
        labelSection.text = sectionNote[section]
        return labelSection.text
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let labelSection = UILabel()
        labelSection.text = sectionNote[section]
        labelSection.backgroundColor = UIColor.green
        return labelSection
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionNote.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var theArr: Note
        if indexPath.section == 0 {
            print("---44444---------------")
            print("newNoteArr = \(newNoteArr)")
            theArr = newNoteArr[indexPath.row]
        } else {
            theArr = selectedNoteArr[indexPath.row]
        }
        
        let cell = noteTableView.dequeueReusableCell(withIdentifier: NoteXibTableViewCell.reuseIdentifier, for: indexPath)
        
        (cell as? NoteXibTableViewCell)?.myTitleCellTextField.text = theArr.title
        (cell as? NoteXibTableViewCell)?.myDateLabel.text = theArr.createdDate
        (cell as? NoteXibTableViewCell)?.myDescriptionLabel.text = theArr.description

        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            if indexPath.section == 0 {
                newNoteArr.remove(at: indexPath.row)
                noteTableView.deleteRows(at: [indexPath], with: .automatic)
            } else {
                selectedNoteArr.remove(at: indexPath.row)
                noteTableView.deleteRows(at: [indexPath], with: .automatic)
            }
        }
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "viewNote" {
//            if let IndexPath = noteTableView.indexPathForSelectedRow,
//                let titl = sender as? UITextField {
//                let titl = titl[IndexPath.row] as! UITextField
//                let controller = (segue.destination as! UINavigationController).topViewController as! ViewNoteViewController
//                controller.editNote.title = titl
//                controller.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
//                controller.navigationItem.leftItemsSupplementBackButton = true
//            }
    
//                let object = sender as? UITextField {
//                let object = object[IndexPath.row] as! UITextField
//                let controller = (segue.destination as! UINavigationController).topViewController as! ViewNoteViewController
//                controller.editNote = object
//                controller.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
//                controller.navigationItem.leftItemsSupplementBackButton = true
//            }
//        }
//    }
    
    
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//
//        let storyboard = UIStoryboard(name: "View Note", bundle: nil)
//        let ViewController = storyboard.instantiateViewController(withIdentifier: "viewNote") as? UINavigationController
//        let controller = ViewController?.topViewController as! ViewNoteViewController
//        
//        
//        
//        controller.titleTextField.text = 
//    }
//            object[indexPath.row] as? UITextField


//        let object = object[indexPath.row] as? Note




//        if indexPath.section == 0 {
//            selectedNoteArr.append(newNoteArr[indexPath.row])
//            newNoteArr.remove(at: indexPath.row)
//        } else {
//            newNoteArr.append(selectedNoteArr[indexPath.row])
//            selectedNoteArr.remove(at: indexPath.row)
//        }
//        noteTableView.reloadData()
//    }
}
