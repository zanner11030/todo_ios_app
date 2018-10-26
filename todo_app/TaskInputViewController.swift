//
//  TaskInputViewController.swift
//  todo_app
//
//  Created by Alexander Caley on 10/24/18.
//  Copyright © 2018 Alexander Caley. All rights reserved.
//

import UIKit

class TaskInputViewController: UIViewController {
    @IBOutlet weak var inputTextField: UITextField!
    
    
    @IBAction func enterButtonPressed(_ sender: Any) {
        var checker = false
        for (index, task) in allTasks.enumerated(){
            if (task.name == "No Tasks yet"){
                allTasks[index].name = inputTextField.text!
                checker = true
            }
        }
        
        if (checker == false){
            allTasks.append(Tasks(name:inputTextField.text!, completed: false))
        }
        dismiss(animated: true, completion: nil)
    }
}
