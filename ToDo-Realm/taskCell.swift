//
//  taskCell.swift
//  ToDo-Realm
//
//  Created by Forest Plasencia on 4/4/17.
//  Copyright © 2017 Forest Plasencia. All rights reserved.
//

import UIKit



class taskCell: UITableViewCell, NibLoadableView {

    @IBOutlet weak var taskDescription: UILabel!
    
    @IBOutlet weak var createdLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    var vc : ToDoVC?
    var task: Task?

    func configureCell(ToDoVC: ToDoVC, task: Task){
        self.vc = ToDoVC
        self.task = task
        self.taskDescription.text = task.taskDesc
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM yyyy hh:mm:ss"
        let createdDate = dateFormatter.string(from: task.createdDate as Date)
        self.createdLbl.text = "Created: \(createdDate)"
        

        
    }
    
    @IBAction func editTaskPressed(_ sender: Any) {
        if let containerVC = self.vc,
            let currentTask = self.task {
            containerVC.editTask(task: currentTask)
        }
    }
    @IBAction func deleteTaskPressed(_ sender: Any) {
        if let containerVC = self.vc,
            let currentTask = self.task {
            containerVC.deleteTask(task: currentTask)
        }
    }
}
