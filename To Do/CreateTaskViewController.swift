//
//  CreateTaskViewController.swift
//  To Do
//
//  Created by Ty Foster on 9/16/19.
//  Copyright © 2019 Foster Coding. All rights reserved.
//

import UIKit

class CreateTaskViewController: UIViewController {

    @IBOutlet weak var taskNameTextField: UITextField!
    @IBOutlet weak var prioritySwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
    }

    @IBAction func addTapped(_ sender: Any) {
        // Create Task from Outlet Information
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let task = Task(context: context)
        task.name = taskNameTextField.text!
        task.priority = prioritySwitch.isOn
        
        // Save Task
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        // Pop back
        navigationController!.popViewController(animated: true)
    }
}
