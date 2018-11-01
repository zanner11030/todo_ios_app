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
    
    func clearItems(){
        DATA.completed.removeAll()
        DATA.completed.append("Nothing Complete yet")
        DATA.saveData()
    }
    
    func itemCompleted(index:Int){
            
            if (DATA.newTasks[index] == "No Tasks yet"){
                return
            }
            else if (DATA.completed[0] == "Nothing Complete yet"){
                DATA.completed.remove(at: 0)
            }
            
            DATA.completed.append(DATA.newTasks[index])
            DATA.newTasks.remove(at: index)
            
            if (DATA.newTasks.count == 0){
                DATA.newTasks.append("No Tasks yet")
            }
            DATA.saveData()
    }
}
