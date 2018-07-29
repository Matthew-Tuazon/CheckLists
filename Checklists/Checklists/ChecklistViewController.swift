//
//  ViewController.swift
//  Checklists
//
//  Created by Mac Os on 7/28/18.
//  Copyright © 2018 Matt Tuazon. All rights reserved.
//

import UIKit

class ChecklistViewController: UITableViewController {

    @IBAction func addItem() { //Creates a new ChecklistItem object and adds to items array
        
        let newRowIndex = items.count //Index 1 less than count
        
        let item = ChecklistItem()
        item.text = "I am a new row"
        item.checked = false
        items.append(item)
        
        let indexPath = IndexPath(row: newRowIndex, section: 0) //updates table view about new row, so add cell for row
        let indexPaths = [indexPath] //temp array holding the new item
        tableView.insertRows(at: indexPaths, with: .automatic) //inserts the new row
        
    }
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
        
        let row5item = ChecklistItem()
        row5item.text = "Eat some chicant"
        row5item.checked = false
        items.append(row5item)
        
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true //set nav controller title to large
        
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
            item.toggleChecked()
            
            configureCheckmark(for: cell, with: item)
        }
        
        tableView.deselectRow(at: indexPath, animated: true) //allows for animation when tapped and deselects
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChecklistItem", for: indexPath)
        let item = items[indexPath.row]
        
        configureText(for: cell, with: item)
        configureCheckmark(for: cell, with: item)
        
        return cell
    }
    
    func configureCheckmark (for cell: UITableViewCell, with item: ChecklistItem) {
        
        
        
        if item.checked {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        
        
    }
    
    func configureText(for cell: UITableViewCell, with item: ChecklistItem) { //sets checklist item's text on cell's label
        let label = cell.viewWithTag(1000) as! UILabel
        label.text = item.text
    }

}

