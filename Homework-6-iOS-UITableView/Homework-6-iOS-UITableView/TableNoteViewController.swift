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
    
    @IBAction func addButton(_ sender: UIButton) {
        rowAdd += 1
        print(rowAdd)
    }
    
    func dateCurrent() -> String {
        let date = NSDate()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy hh:mm:ss"
        return dateFormatter.string(from: date as Date)
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
        print("func return RowAdd = \(rowAdd)")
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = noteTableView.dequeueReusableCell(withIdentifier: "MyNoteCell", for: indexPath)
        
        let Rand = Int.random(in: 0...2)
        
        if let myTitleCellTextField = cell.viewWithTag(1) as? UITextField {
                myTitleCellTextField.text = titleArr[Rand]
            }
        if let myDateLabel = cell.viewWithTag(2) as? UILabel {
                myDateLabel.text = dateCurrent()
            }
        switch Rand {
            case 1:
                if let myDescriptionLabel = cell.viewWithTag(3) as? UILabel {
                    myDescriptionLabel.text = descriptionFoodArr[Rand]
                }
            case 2:
                if let myDescriptionLabel = cell.viewWithTag(3) as? UILabel {
                    myDescriptionLabel.text = descriptionTipsArr[Rand]
                }
            default:
                if let myDescriptionLabel = cell.viewWithTag(3) as? UILabel {
                    myDescriptionLabel.text = descriptionLoveArr[Rand]
                }
            }
        return cell
    }
}

//extension TableNoteViewController: UITableViewDelegate {
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print("Selected \(indexPath.row)")
//    }
//}
