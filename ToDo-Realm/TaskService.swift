//
//  TaskService.swift
//  ToDo-Realm
//
//  Created by Forest Plasencia on 4/4/17.
//  Copyright © 2017 Forest Plasencia. All rights reserved.
//

import Foundation
import RealmSwift

class TaskService {
    private static let _instance = TaskService()
    
   // weak var delegate: FindMoonServiceDelegate?
    
    /*
    init(taskList: TaskList){
        self.taskList = taskList
    } */
    
    static var instance: TaskService {
        return _instance
    }

    let taskList = TaskList()
    
    let realm = try! Realm()

    
    func createTask(taskDesc: String, taskPriority: Int) {
        let newTask = Task()
        newTask.taskDesc = taskDesc
        newTask.taskPriority = taskPriority
        newTask.createdDate = NSDate()
        newTask.taskId = 1
        
        self.taskList.tasks.append(newTask)
    }
    
    
    func editTaskDesc(taskId: Int, newDesc: String){
        
        let taskToEdit = Task()
        taskToEdit.taskDesc = newDesc
        taskToEdit.taskId = taskId
        
        try! realm.write {
            realm.add(taskToEdit, update: true)
        }
    }
    
    func editTaskPriority(taskId: Int, newPriority: Int) {
        
        let taskToEdit = Task()
        taskToEdit.taskPriority = newPriority
        taskToEdit.taskId = taskId
        
        try! realm.write {
            realm.add(taskToEdit, update: true)
        }
        
    }
    
    func deleteTask(taskToDelete: Task) {
        try! realm.write {
            realm.delete(taskToDelete)
        }
        
    }
    
}
