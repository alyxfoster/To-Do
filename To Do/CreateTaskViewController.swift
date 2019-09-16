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
    
    var prevVC = TasksViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
    }

    @IBAction func addTapped(_ sender: Any) {
        // Create Task from Outlet Information
        let task = Task()
        task.name = taskNameTextField.text!
        task.priority = prioritySwitch.isOn
        
        // Add new Task to array in last view controller
        prevVC.tasks.append(task)
        prevVC.GroupTable.reloadData()
        
        navigationController!.popViewController(animated: true)
    }
}
