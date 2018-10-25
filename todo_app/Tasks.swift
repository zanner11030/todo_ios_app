//
//  Tasks.swift
//  todo_app
//
//  Created by Alexander Caley on 10/23/18.
//  Copyright © 2018 Alexander Caley. All rights reserved.
//

import Foundation

struct Tasks{
    var name:String
    var completed:Bool
}

var allTasks:[Tasks] = [Tasks(name: "No Tasks yet", completed: false), Tasks(name: "Nothing Complete yet", completed: true)]
