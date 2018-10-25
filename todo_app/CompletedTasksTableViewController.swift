//
//  CompletedTasksTableViewController.swift
//  todo_app
//
//  Created by Alexander Caley on 10/24/18.
//  Copyright © 2018 Alexander Caley. All rights reserved.
//

import UIKit

class CompletedTasksTableViewController: UITableViewController{
    
    var completedTasks = [Tasks]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for task in allTasks{
            if (task.completed == true){
                completedTasks.append(task)
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return completedTasks.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let task = completedTasks[indexPath.row].name
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "completedTasksCell")!
        cell.textLabel?.text = task
        return cell
    }
    
    //Item Pressed
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //Nothing
    }
}
