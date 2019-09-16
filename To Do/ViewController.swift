//
//  ViewController.swift
//  To Do
//
//  Created by Ty Foster on 9/15/19.
//  Copyright © 2019 Foster Coding. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var GroupTable: UITableView!
    
    var tasks : [Task] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tasks = makeTasks()
        
        GroupTable.dataSource = self
        GroupTable.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let task = tasks[indexPath.row]
        if(task.priority) {cell.textLabel?.text = "!!! \(task.name)"}
        else {cell.textLabel?.text = task.name}
        return cell
    }

    func makeTasks() -> [Task] {
        let task1 = Task()
        task1.name = "Complete App"
        let task2 = Task()
        task2.name = "Build Website"
        task2.priority = true
        let task3 = Task()
        task3.name = "Grocery Shopping"
        
        return [task1, task2, task3]
    }

}

