//
//  TaskList.swift
//  ToDo-Realm
//
//  Created by Forest Plasencia on 4/4/17.
//  Copyright © 2017 Forest Plasencia. All rights reserved.
//

import Foundation
import RealmSwift

class TaskList: Object {
    let tasks = List<Task>()
}
