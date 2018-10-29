//
//  Tasks.swift
//  todo_app
//
//  Created by Alexander Caley on 10/23/18.
//  Copyright © 2018 Alexander Caley. All rights reserved.
//

import Foundation

var DATA = Defaults()

class Defaults{
    var newTasks:[String]
    var completed:[String]
    
    init() {
        self.newTasks = ["No Tasks yet"]
        self.completed = ["Nothing Complete yet"]
    }
    
    func saveData(){
        let defaults = UserDefaults.standard
        
        defaults.set(self.newTasks, forKey: "newTasks")
        defaults.set(self.completed, forKey: "completed")
    }
    
    func loadData(){
        let defaults = UserDefaults.standard
        if (defaults.array(forKey: "newTasks") != nil){
            self.newTasks = defaults.array(forKey: "newTasks") as! [String]
            self.completed = defaults.array(forKey: "completed") as! [String]
        }
    }
}
