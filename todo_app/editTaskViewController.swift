//
//  editViewController.swift
//  todo_app
//
//  Created by Alexander Caley on 11/1/18.
//  Copyright © 2018 Alexander Caley. All rights reserved.
//

import UIKit

class editTaskViewController:UIViewController{
    
    @IBOutlet weak var editTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        editTextField.becomeFirstResponder()
        NotificationCenter.default.addObserver(self, selector: #selector(self.notificationReceived(notification:)), name: NSNotification.Name(rawValue: "indexData"), object: nil)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name(rawValue: "indexData"), object: nil)
    }
    
    @objc func notificationReceived(notification: NSNotification){
        let index = notification.object as! Int
        editTextField.text = DATA.newTasks[index]
    }
    
    @IBAction func cancelButtonPressed(_ sender: Any) {
        self.view.endEditing(true)
        dismiss(animated: true, completion: nil)
    }
}
