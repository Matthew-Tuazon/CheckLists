//
//  ViewController.swift
//  Checklists
//
//  Created by Mac Os on 7/28/18.
//  Copyright © 2018 Matt Tuazon. All rights reserved.
//

import UIKit

class ChecklistViewController: UITableViewController {

    var items: [ChecklistItem] //declares items will hold array of ChecklistItem Obecjts

    
    required init?(coder aDecoder: NSCoder) {
        items = [ChecklistItem]() //create array object
        
        let row0item = ChecklistItem() //create new CheckListItem object
        row0item.text = "Walk the dog" //set properties for each individual object
        row0item.checked = false
        items.append(row0item)
        
        let row1item = ChecklistItem()
        row1item.text = "Brush my teeth"
        row1item.checked = false
        items.append(row1item)
        
        let row2item = ChecklistItem()
        row2item.text = "Learn iOS Dev"
        row2item.checked = false
        items.append(row2item)
        
        let row3item = ChecklistItem()
        row3item.text = "Practice volleyball skills"
        row3item.checked = false
        items.append(row3item)
        
        let row4item = ChecklistItem()
        row4item.text = "Eat some chicken"
        row4item.checked = false
        items.append(row4item)
        
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
        return items.count //returns number of rows inputted
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        
        if let cell = tableView.cellForRow(at: indexPath){
            
            let item = items[indexPath.row] //asks the array for ChecklistItem object that corresponds to row number
            item.checked = !item.checked
            
            configureCheckmark(for: cell, at: indexPath)
        }
        
        tableView.deselectRow(at: indexPath, animated: true) //allows for animation when tapped and deselects
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChecklistItem", for: indexPath)
        let item = items[indexPath.row]
        
        let label = cell.viewWithTag(1000) as! UILabel
        
        label.text = item.text
        
        
        
        configureCheckmark(for: cell, at: indexPath)
        return cell
    }
    
    func configureCheckmark (for cell: UITableViewCell, at indexPath: IndexPath) {
        
        let item = items[indexPath.row]
        
        if item.checked {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        
        
    }

}

