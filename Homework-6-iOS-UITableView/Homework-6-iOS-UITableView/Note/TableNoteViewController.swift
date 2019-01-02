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
    var selectedNoteArr: [Note] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.newNoteArr = [Note.init(title: "tit_1", description: "des_2", createdDate: "02 Jan 2019 11:20:00", completed: false)]
        
        let cellNib = UINib(nibName: "NoteXibTableViewCell", bundle: nil)
        noteTableView.register(cellNib, forCellReuseIdentifier: NoteXibTableViewCell.reuseIdentifier)
        noteTableView.reloadData()
    }
    
// Add new Note
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("prepare identifier = add Note")
        if segue.identifier == "addNote" {
            let addController = segue.destination as! AddNoteViewController
            addController.newSaveNote = { (note) in
                print("prepare addController.newSaveNote \(note)")
                if note.completed {
                    self.selectedNoteArr.append(note)
                    self.selectedNoteArr.sort(by: {$0.createdDate > $1.createdDate})
                } else {
                    self.newNoteArr.append(note)
                    self.newNoteArr.sort(by: {$0.createdDate > $1.createdDate})
                }
                self.noteTableView.reloadData()
            }
        }
        
//        if segue.identifier == "viewNote" {
//            let viewController = segue.destination as! ViewNoteViewController
//            viewController.editSaveNote = { (noteEdit) in
//                print("prepare viewController.newSaveNote \(noteEdit)")
//                if noteEdit.completed {
//                    self.selectedNoteArr.append(noteEdit)
//                    self.selectedNoteArr.sort(by: {$0.createdDate > $1.createdDate})
//                } else {
//                    self.newNoteArr.append(noteEdit)
//                    self.newNoteArr.sort(by: {$0.createdDate > $1.createdDate})
//                }
//                self.noteTableView.reloadData()
//            }
//        }
    }
}

// MARK: - UITableViewDataSource

extension TableNoteViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
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
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Note", bundle: nil)
        let editController = storyboard.instantiateViewController(withIdentifier: "ViewNoteViewController") as! ViewNoteViewController
        
        if indexPath.section == 0 {
            editController.editNote = newNoteArr[indexPath.row]
            newNoteArr.remove(at: indexPath.row)
            noteTableView.reloadData()
        } else {
            editController.editNote = selectedNoteArr[indexPath.row]
            selectedNoteArr.remove(at: indexPath.row)
            noteTableView.reloadData()
        }
        navigationController?.pushViewController(editController, animated: true)
        
        editController.editSaveNote = { (noteEdit) in
            print("didSelectRowAt editController.editSaveNote \(noteEdit)")
            if noteEdit.completed {
                self.selectedNoteArr.append(noteEdit)
                self.selectedNoteArr.sort(by: {$0.createdDate > $1.createdDate})
            } else {
                self.newNoteArr.append(noteEdit)
                self.newNoteArr.sort(by: {$0.createdDate > $1.createdDate})
            }
        self.noteTableView.reloadData()
        }
    }
}
