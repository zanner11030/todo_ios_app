//
//  NewTasksViewController.swift
//  todo_app
//
//  Created by Alexander Caley on 10/22/18.
//  Copyright © 2018 Alexander Caley. All rights reserved.
//

import UIKit

class NewTasksTableViewController: UITableViewController{
    
    var newTasks: [Tasks] = [Tasks(name: "test", completed: false)]
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newTasks.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let task = newTasks[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "tasksCell")!
        cell.textLabel?.text = task.name
        return cell
    }
    //Item Pressed
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(newTasks[indexPath.row].name)
    }
}
