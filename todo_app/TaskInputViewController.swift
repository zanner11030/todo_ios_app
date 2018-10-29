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
        if (inputTextField.text! == ""){
            dismiss(animated: true, completion: nil)
            return
        }
        var checker = false
        for (index, task) in DATA.newTasks.enumerated(){
            if (task == "No Tasks yet"){
                checker = true
                DATA.newTasks[index] = inputTextField.text!
            }
        }
        if (checker == false){
            DATA.newTasks.append(inputTextField.text!)
        }
        DATA.saveData()
        dismiss(animated: true, completion: nil)
    }
}
