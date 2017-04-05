//
//  TaskDetailVC.swift
//  ToDo-Realm
//
//  Created by Forest Plasencia on 4/4/17.
//  Copyright © 2017 Forest Plasencia. All rights reserved.
//

import UIKit

class TaskDetailVC: UIViewController {
    
    @IBOutlet weak var descriptionTextField: UITextField!
    
    @IBOutlet weak var prioritySelector: UISegmentedControl!
    
    var task: Task?
    var ts: TaskService!
    
    var newTask = true

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let editableTask = self.task {
            self.descriptionTextField.text = editableTask.taskDesc
            self.prioritySelector.selectedSegmentIndex = editableTask.taskPriority
            self.newTask = false
        }
    }


    @IBAction func finishBtnPressed(_ sender: Any) {
        
        guard let taskDescription = self.descriptionTextField.text else {
            return
        }
        
        guard taskDescription != "" else {
            return
        }
        
        let taskPriority = self.prioritySelector.selectedSegmentIndex
        
        if newTask {
            self.ts.createTask(taskDesc: taskDescription, taskPriority: taskPriority)
        } else {
            if let id = task?.taskId {
                self.ts.editTask(taskId: id, newDesc: taskDescription, newPriority: taskPriority)
            }
        }
        
        
        self.dismiss(animated: true, completion: nil)
    }

}
