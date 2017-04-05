//
//  ViewController.swift
//  ToDo-Realm
//
//  Created by Forest Plasencia on 4/4/17.
//  Copyright © 2017 Forest Plasencia. All rights reserved.
//

import UIKit
import RealmSwift

class ToDoVC: UIViewController  {

    @IBOutlet weak var tableView: UITableView!
    
    let ts = TaskService.instance
   // var taskList: TaskList?
    lazy var realm = try! Realm()

    var tasks : Results<Task>?
    
    let taskDetailSegue = "goToTaskDetailVC"
    
//    var tasks: RLMResults<RLMObject> {
//        get {
//            return Task.allObjects()
//        }
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
      //  self.taskList = ts.taskList
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(taskCell.self)
        
//        var todos: Array<Any> {
//            get {
//                return TaskList.allObjcs
//            }
//        }
        self.tasks = realm.objects(Task)
        print(tasks)
    }


    override func viewWillAppear(_ animated: Bool) {
       // self.taskList = ts.taskList
        self.tableView.reloadData()
    }

    @IBAction func addTaskPressed(_ sender: Any) {
        self.performSegue(withIdentifier: self.taskDetailSegue, sender: nil)

    }
    
    func editTask(task: Task) {
        self.performSegue(withIdentifier: self.taskDetailSegue, sender: task)
    }
    
    func deleteTask(task: Task) {
        self.ts.deleteTask(taskToDelete: task)
        self.tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == self.taskDetailSegue {
            let taskDetailVC = (segue.destination as? TaskDetailVC)
            taskDetailVC?.ts = self.ts 
            if let editableTask = sender as? Task {
                taskDetailVC?.task = editableTask
            }
        
        }

    }
    
    
}

extension ToDoVC: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        var numRows = 0
        
        if let numTasks = self.tasks?.count {
            numRows = numTasks
            print("num tasks: \(numTasks)")
        }
        
        return numRows
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 300

        if let tasks = self.tasks {
            print("Tasks: \(tasks)")
            
            let task = tasks[indexPath.row]
            
            let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as taskCell
            cell.configureCell(ToDoVC: self, task: task)
            
            return cell
            
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    }
    
}

