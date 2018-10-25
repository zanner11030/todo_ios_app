//
//  NewTasksViewController.swift
//  todo_app
//
//  Created by Alexander Caley on 10/22/18.
//  Copyright © 2018 Alexander Caley. All rights reserved.
//

import UIKit

class NewTasksTableViewController: UITableViewController{

    var newTasks = [Tasks]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for task in allTasks{
            if (task.completed == false){
                newTasks.append(task)
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newTasks.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let task = newTasks[indexPath.row].name
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "newTasksCell")!
        cell.textLabel?.text = task
        return cell
    }
    //Item Pressed
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if (allTasks[1].name == "Nothing Complete yet"){
            allTasks.remove(at: 1)
        }
        
        var amountLeft = 0
        
        for (index, _) in allTasks.enumerated(){
            if (allTasks[index].completed == false){
                amountLeft+=1
            }
            if (allTasks[index].name == newTasks[indexPath.row].name){
                allTasks[index].completed = true
            }
        }
        
        if (amountLeft <= 1){
            allTasks.append(Tasks(name: "No Tasks yet", completed: false))
        }
    }
}
