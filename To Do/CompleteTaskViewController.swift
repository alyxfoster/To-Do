//
//  CompleteTaskViewController.swift
//  To Do
//
//  Created by Ty Foster on 9/16/19.
//  Copyright © 2019 Foster Coding. All rights reserved.
//

import UIKit

class CompleteTaskViewController: UIViewController {
    
    var task = Task()
    var prevVC = TasksViewController()
    
    @IBOutlet weak var taskLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if(task.priority) {taskLabel.text = "!!! \(task.name)"}
        else {taskLabel.text = task.name}
    }
    
    @IBAction func completeTapped(_ sender: Any) {
        prevVC.tasks.remove(at: prevVC.selectedIndex)
        prevVC.GroupTable.reloadData()
        
        navigationController!.popViewController(animated: true)
    }
    
}
