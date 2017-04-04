//
//  ViewController.swift
//  ToDo-Realm
//
//  Created by Forest Plasencia on 4/4/17.
//  Copyright © 2017 Forest Plasencia. All rights reserved.
//

import UIKit


class ToDoVC: UIViewController  {

    @IBOutlet weak var tableView: UITableView!
    
    let ts = TaskService.instance
    var taskList: TaskList?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.taskList = ts.taskList
        
    }



    @IBAction func addTaskPressed(_ sender: Any) {
    }
    
    
}

extension ToDoVC: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        var numRows = 0
        
        return numRows
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        

        
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    }
    
}

