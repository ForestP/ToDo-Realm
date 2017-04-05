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

   // let taskList = TaskList()
    
    lazy var realm = try! Realm()

    
    func createTask(taskDesc: String, taskPriority: Int) {
        let newTask = Task()
        newTask.taskDesc = taskDesc
        newTask.taskPriority = taskPriority
        newTask.createdDate = NSDate()
      //  let newId = taskList.currentId + 1
       // self.taskList.currentId = newId
        newTask.taskId = UUID().uuidString
        
       // self.taskList.tasks.append(newTask)
        
        try! realm.write {
            self.realm.add(newTask)
        }
        
        
    }
    
    
    func editTaskDesc(taskId: String, newDesc: String){
        
        let taskToEdit = Task()
        taskToEdit.taskDesc = newDesc
        taskToEdit.taskId = taskId
        
        try! realm.write {
            realm.add(taskToEdit, update: true)
        }
    }
    
    func editTask(taskId: String, newDesc: String, newPriority: Int) {
        
        let taskToEdit = Task()
        taskToEdit.taskDesc = newDesc
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
