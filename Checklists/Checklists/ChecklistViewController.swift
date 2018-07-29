//
//  ViewController.swift
//  Checklists
//
//  Created by Mac Os on 7/28/18.
//  Copyright © 2018 Matt Tuazon. All rights reserved.
//

import UIKit

class ChecklistViewController: UITableViewController {

    var row0item: CheckListItem
    var row1item: CheckListItem
    var row2item: CheckListItem
    var row3item: CheckListItem
    var row4item: CheckListItem
    
    required init?(coder aDecoder: NSCoder) {
        
        
        row0item = CheckListItem() //create new CheckListItem object 
        row0item.text = "Walk the dog" //set properties for each individual object
        row0item.checked = false
        
        row1item = CheckListItem()
        row1item.text = "Brush my teeth"
        row1item.checked = false
        
        row2item = CheckListItem()
        row2item.text = "Learn iOS Dev"
        row2item.checked = false
        
        row3item = CheckListItem()
        row3item.text = "Practice volleyball skills"
        row3item.checked = false
        
        row4item = CheckListItem()
        row4item.text = "Eat some chicken"
        row4item.checked = false
        
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5 //returns number of rows inputted
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        
        if let cell = tableView.cellForRow(at: indexPath){
            
            if indexPath.row == 0 {
                row0item.checked = !row0item.checked
            } else if indexPath.row == 1 {
                row1item.checked = !row1item.checked
            } else if indexPath.row == 2 {
                row2item.checked = !row2item.checked
            } else if indexPath.row == 3 {
                row3item.checked = !row3item.checked
            } else if indexPath.row == 4 {
                row4item.checked = !row4item.checked
            }
            
            configureCheckmark(for: cell, at: indexPath)
        }
        
        tableView.deselectRow(at: indexPath, animated: true) //allows for animation when tapped and deselects
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChecklistItem", for: indexPath)
        
        let label = cell.viewWithTag(1000) as! UILabel
        if indexPath.row == 0 {
            label.text = row0item.text
        } else if indexPath.row == 1 {
            label.text = row1item.text
        } else if indexPath.row == 2 {
            label.text = row2item.text
        } else if indexPath.row == 3 {
            label.text = row3item.text
        } else if indexPath.row == 4 {
            label.text = row4item.text
        }
        
        configureCheckmark(for: cell, at: indexPath)
        return cell
    }
    
    func configureCheckmark (for cell: UITableViewCell, at indexPath: IndexPath) {
        var isChecked = false
        
        if indexPath.row == 0 {
            isChecked = row0item.checked
        } else if indexPath.row == 1 {
            isChecked = row1item.checked
        } else if indexPath.row == 2 {
            isChecked = row2item.checked
        } else if indexPath.row == 3 {
            isChecked = row3item.checked
        } else if indexPath.row == 4 {
            isChecked = row4item.checked
        }
        
        if isChecked {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        
        
    }

}

