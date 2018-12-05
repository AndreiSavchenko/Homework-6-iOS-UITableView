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
    
    var rowAdd: Int = 0
    let titleArr: [String] = ["Альф про любовь","Альф про еду","Советы от Альфа"]
    let descriptionLoveArr: [String] = ["Ей пришла в голову глупейшая мысль, что она меня больше не любит.",
                                        "Боюсь, тебе придется любить меня до гроба.",
                                        "Я вас, люди, не понимаю. Если вы любите кого-то, вы боитесь, чтоб он узнал об этом. Но, когда оказывается, что вы ему тоже небезразличны, вы жалеете о потерянном времени. А если завтра ваша планета взорвется?"]
    let descriptionFoodArr: [String] = ["Твои веки тяжелеют... Ты засыпаешь... Ты больше не кот... Ты бублик.",
                                        "Овощи — это не еда, это то, что едят с едой!",
                                        "Вы не любите кошек? Да вы просто не умеете их готовить!"]
    let descriptionTipsArr: [String] = ["Лин, послушай старших: оставь искусство! Действуй по плану «А» — хватайся за первого попавшегося богача.",
                                        "Ой-ой-ой, стоит только указать кому-нибудь на прореху в его мировоззрении, и он сразу обижается.",
                                        "— И не вини себя.\n— А я и не виню.\n— Значит, ты слушал меня невнимательно."]
    var sectionNote: [String] = ["Все нотатки", "Выбранные"]
    
    struct Note {
        var title = String()
        var createdDate = String()
        var description = String()
    }
    
    var allNoteArr = [Note]()
    
    func dateCurrent() -> String {
        let date = NSDate()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy hh:mm:ss"
        return dateFormatter.string(from: date as Date)
    }
    
    @IBAction func addButton(_ sender: UIButton) {
        
        let Rand = Int.random(in: 0...2)
        var titleInNote, dateInNote, descriptionInNote: String
        
        titleInNote = titleArr[Rand]
        dateInNote = dateCurrent()
        
        switch Rand {
        case 1:
            descriptionInNote = descriptionFoodArr[Rand]
        case 2:
            descriptionInNote = descriptionTipsArr[Rand]
        default:
            descriptionInNote = descriptionLoveArr[Rand]
        }

        let oneNote = Note.init(title: titleInNote, createdDate: dateInNote, description: descriptionInNote)
        
        print(oneNote)
        self.add(oneNote)
        noteTableView.reloadData()
        
        
//        rowAdd += 1
//        noteTableView.reloadData()
//        print(rowAdd)
    }
    
    func add(_ oneNote: TableNoteViewController.Note) {
        let index = 0
        allNoteArr.insert(oneNote, at: index)
        
//        let indexPath = IndexPath(row: index, section: 0)
//        noteTableView.insertRows(at: [indexPath], with: .left)
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let cellNib = UINib(nibName: "NoteXibTableViewCell", bundle: nil)
        noteTableView.register(cellNib, forCellReuseIdentifier: NoteXibTableViewCell.reuseIdentifier)

        noteTableView.reloadData()
    }
}

// MARK: - UITableViewDataSource
extension TableNoteViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allNoteArr.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let labelSection = UILabel()
        labelSection.text = sectionNote[section]
        labelSection.backgroundColor = UIColor.black
        return labelSection.text
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionNote.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = noteTableView.dequeueReusableCell(withIdentifier: NoteXibTableViewCell.reuseIdentifier, for: indexPath)
        
        if let myTitleCellTextField = cell.viewWithTag(1) as? UITextField {
                myTitleCellTextField.text = allNoteArr[indexPath.row].title
            }
        if let myDateLabel = cell.viewWithTag(2) as? UILabel {
                myDateLabel.text = allNoteArr[indexPath.row].createdDate
            }
        if let myDescriptionLabel = cell.viewWithTag(3) as? UILabel {
                myDescriptionLabel.text = allNoteArr[indexPath.row].description
            }
        return cell
    }
}

//extension TableNoteViewController: UITableViewDelegate {
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print("Selected \(indexPath.row)")
//    }
//}
