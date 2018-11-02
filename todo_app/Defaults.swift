//
//  Tasks.swift
//  todo_app
//
//  Created by Alexander Caley on 10/23/18.
//  Copyright © 2018 Alexander Caley. All rights reserved.
//

import Foundation

var data = Defaults()

class Defaults{
    var newTasks:[String]
    var completed:[String]
    
    init() {
        self.newTasks = ["No Tasks yet"]
        self.completed = ["Nothing Complete yet"]
        let defaults = UserDefaults.standard
        if (defaults.array(forKey: "newTasks") != nil){
            self.newTasks = defaults.array(forKey: "newTasks") as! [String]
            self.completed = defaults.array(forKey: "completed") as! [String]
        }
    }
    
    func saveData(){
        let defaults = UserDefaults.standard
        
        defaults.set(self.newTasks, forKey: "newTasks")
        defaults.set(self.completed, forKey: "completed")
    }
    
    func clearItems(){
        self.completed.removeAll()
        self.completed.append("Nothing Complete yet")
        self.saveData()
    }
    
    func itemCompleted(index:Int){
            
            if (self.newTasks[index] == "No Tasks yet"){
                return
            }
            else if (self.completed[0] == "Nothing Complete yet"){
                self.completed.remove(at: 0)
            }
            
            self.completed.append(self.newTasks[index])
            self.newTasks.remove(at: index)
            
            if (self.newTasks.count == 0){
                self.newTasks.append("No Tasks yet")
            }
            self.saveData()
    }
    
    func inputItem(item:String?){
        if (item! == ""){
            //dismiss(animated: true, completion: nil)
            return
        }
        var checker = false
        for (index, task) in data.newTasks.enumerated(){
            if (task == "No Tasks yet"){
                checker = true
                data.newTasks[index] = item!
            }
        }
        if (checker == false){
            data.newTasks.append(item!)
        }
        data.saveData()
    }
}
