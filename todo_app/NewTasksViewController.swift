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
        DATA.loadData()
        self.tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(loadView), name: NSNotification.Name(rawValue: "load"), object: nil)
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
        DATA.itemCompleted(index: indexPath.row)
        tableView.reloadData()
    }
}
