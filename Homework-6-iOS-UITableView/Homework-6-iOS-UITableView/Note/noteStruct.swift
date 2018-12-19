//
//  noteStruct.swift
//  Homework-6-iOS-UITableView
//
//  Created by Alla on 12/19/18.
//  Copyright © 2018 AndreiSavchenko. All rights reserved.
//

import Foundation

struct Note {
    var title: String
    var description: String
    var createdDate: String
    var completed: Bool
    
    init(title: String, description: String, createdDate: String, completed: Bool) {
        self.title = title
        self.description = description
        self.createdDate = createdDate
        self.completed = completed
    }
}

//var allNoteArr = [Note]()
