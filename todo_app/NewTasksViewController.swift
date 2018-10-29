//
//  NewTasksViewController.swift
//  todo_app
//
//  Created by Alexander Caley on 10/22/18.
//  Copyright © 2018 Alexander Caley. All rights reserved.
//

import UIKit

class NewTasksTableViewController: UITableViewController{
    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        for task in allTasks{
//            if (task.completed == false){
//                newTasks.append(task)
//            }
//        }
//    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        DATA.loadData()
        self.tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DATA.newTasks.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let task = DATA.newTasks[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "newTasksCell")!
        cell.textLabel?.text = task
        return cell
    }
    //Item Pressed
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if (DATA.newTasks[indexPath.row] == "No Tasks yet"){
            return
        }
        else if (DATA.completed[0] == "Nothing Complete yet"){
            DATA.completed.remove(at: 0)
        }
        
        DATA.completed.append(DATA.newTasks[indexPath.row])
        DATA.newTasks.remove(at: indexPath.row)
        
        if (DATA.newTasks.count == 0){
            DATA.newTasks.append("No Tasks yet")
        }
        DATA.saveData()
        tableView.reloadData()
    }
}
