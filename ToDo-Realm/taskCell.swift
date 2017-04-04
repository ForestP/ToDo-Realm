//
//  taskCell.swift
//  ToDo-Realm
//
//  Created by Forest Plasencia on 4/4/17.
//  Copyright © 2017 Forest Plasencia. All rights reserved.
//

import UIKit

class taskCell: UITableViewCell {

    @IBOutlet weak var taskDescription: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configureCell(task: Task){
        
    }
    
    @IBAction func editTaskPressed(_ sender: Any) {
        
    }
    @IBAction func deleteTaskPressed(_ sender: Any) {
        
    }
}
