//
//  Task.swift
//  ToDo-Realm
//
//  Created by Forest Plasencia on 4/4/17.
//  Copyright © 2017 Forest Plasencia. All rights reserved.
//

import Foundation
import RealmSwift

class Task: Object {
    dynamic var taskDesc = ""
    dynamic var createdDate = NSDate()
    dynamic var taskPriority = 0
    dynamic var taskId = 0
    
    override static func primaryKey() -> String? {
        return "taskId"
    }

}
