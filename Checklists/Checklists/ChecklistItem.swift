//
//  ChecklistItem.swift
//  Checklists
//
//  Created by Mac Os on 7/29/18.
//  Copyright © 2018 Matt Tuazon. All rights reserved.
//

import Foundation

class ChecklistItem {
    var text = ""
    var checked = false
    
    func toggleChecked() { //allows for checklistitem to toggle off/on 
        checked = !checked
    }

}


