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
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name(rawValue: "load"), object: nil)
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
        //Nothing
    }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt: IndexPath) -> [UITableViewRowAction]? {
        let complete = UITableViewRowAction(style: .normal, title: "Complete") { action, index in
            DATA.itemCompleted(index: editActionsForRowAt.row)
            if (DATA.newTasks.count == 1 && DATA.newTasks[0] == "No Tasks yet"){
                self.tableView.reloadData()
            }
            else{
                self.tableView.deleteRows(at: [editActionsForRowAt], with: .right)
            }
            print("complete button tapped")
        }
        complete.backgroundColor = .green
        
        let edit = UITableViewRowAction(style: .normal, title: "Edit") { action, index in
            let index = editActionsForRowAt.row
            self.performSegue(withIdentifier: "editTaskSegue", sender: nil)
            print("edit button tapped")
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "indexData"), object: index)
        }
        edit.backgroundColor = .blue
        
        return [complete, edit]
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        if (DATA.newTasks[indexPath.row] == "No Tasks yet"){return false}
        else {return true}
    }
}
