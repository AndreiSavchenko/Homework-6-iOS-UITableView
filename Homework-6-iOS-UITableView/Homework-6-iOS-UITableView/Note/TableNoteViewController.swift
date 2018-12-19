//
//  ViewController.swift
//  Homework-6-iOS-UITableView
//
//  Created by Alla on 12/1/18.
//  Copyright © 2018 AndreiSavchenko. All rights reserved.
//

import UIKit

class TableNoteViewController: UIViewController {
    
    @IBOutlet weak var noteTableView: UITableView!
    
//    let titleArr: [String] = ["Альф про любовь","Альф про еду","Советы от Альфа"]
//    let descriptionLoveArr: [String] = ["Ей пришла в голову глупейшая мысль, что она меня больше не любит.",
//                                        "Боюсь, тебе придется любить меня до гроба.",
//                                        "Я вас, люди, не понимаю. Если вы любите кого-то, вы боитесь, чтоб он узнал об этом. Но, когда оказывается, что вы ему тоже небезразличны, вы жалеете о потерянном времени. А если завтра ваша планета взорвется?"]
//    let descriptionFoodArr: [String] = ["Твои веки тяжелеют... Ты засыпаешь... Ты больше не кот... Ты бублик.",
//                                        "Овощи — это не еда, это то, что едят с едой!",
//                                        "Вы не любите кошек? Да вы просто не умеете их готовить!"]
//    let descriptionTipsArr: [String] = ["Лин, послушай старших: оставь искусство! Действуй по плану «А» — хватайся за первого попавшегося богача.",
//                                        "Ой-ой-ой, стоит только указать кому-нибудь на прореху в его мировоззрении, и он сразу обижается.",
//                                        "— И не вини себя.\n— А я и не виню.\n— Значит, ты слушал меня невнимательно."]
    
    let sectionNote: [String] = ["New", "Completed"]
    
    var newNoteArr = [Note]()
    var selectedNoteArr = [Note]()
    
    
//    func dateCurrent() -> String {
//        let date = NSDate()
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "dd.MM hh:mm:ss"
//        return dateFormatter.string(from: date as Date)
//    }
    
//    @IBAction func addButton(_ sender: UIButton) {
//
//        let Rand = Int.random(in: 0...2)
//        var titleInNote, dateInNote, descriptionInNote: String
//
//        titleInNote = titleArr[Rand]
//        dateInNote = dateCurrent()
//
//        switch Rand {
//        case 1:
//            descriptionInNote = descriptionFoodArr[Rand]
//        case 2:
//            descriptionInNote = descriptionTipsArr[Rand]
//        default:
//            descriptionInNote = descriptionLoveArr[Rand]
//        }
//
//        let oneNote = Note.init(title: titleInNote, createdDate: dateInNote, description: descriptionInNote)
//
//        self.addAllNote(oneNote)
//        noteTableView.reloadData()
//    }
//
//    func addAllNote(_ oneNote: TableNoteViewController.Note) {
//        let index = 0
//        newNoteArr.insert(oneNote, at: index)
//    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let cellNib = UINib(nibName: "NoteXibTableViewCell", bundle: nil)
        noteTableView.register(cellNib, forCellReuseIdentifier: NoteXibTableViewCell.reuseIdentifier)
        noteTableView.reloadData()
        print("999999999999")
        print(newNoteArr)
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
            print(888888)
            print(theArr)
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
        if indexPath.section == 0 {
            selectedNoteArr.append(newNoteArr[indexPath.row])
            newNoteArr.remove(at: indexPath.row)
        } else {
            newNoteArr.append(selectedNoteArr[indexPath.row])
            selectedNoteArr.remove(at: indexPath.row)
        }
        noteTableView.reloadData()
    }
}
