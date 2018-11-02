//
//  NewTasksViewController.swift
//  todo_app
//
//  Created by Alexander Caley on 10/22/18.
//  Copyright © 2018 Alexander Caley. All rights reserved.
//

import UIKit

class NewTasksTableViewController: UITableViewController{
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(loadView), name: NSNotification.Name(rawValue: "load"), object: nil)
        self.tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.newTasks.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let task = data.newTasks[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "newTasksCell")!
        cell.textLabel?.text = task
        return cell
    }
    //Item Pressed
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //Nothing
    }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt: IndexPath) -> [UITableViewRowAction]? {
        let complete = UITableViewRowAction(style: .normal, title: "Complete") { action, index in
            data.itemCompleted(index: editActionsForRowAt.row)
            if (data.newTasks.count == 1 && data.newTasks[0] == "No Tasks yet"){
                self.tableView.reloadData()
            }
            else{
                self.tableView.deleteRows(at: [editActionsForRowAt], with: .right)
            }
            print("complete button tapped")
        }
        complete.backgroundColor = .green
        
        let edit = UITableViewRowAction(style: .normal, title: "Edit") { action, index in
            self.performSegue(withIdentifier: "editViewControllerID", sender: nil)
            print("edit button tapped")
        }
        edit.backgroundColor = .blue
        
        return [complete, edit]
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        if (data.newTasks[indexPath.row] == "No Tasks yet"){return false}
        else {return true}
    }
}
