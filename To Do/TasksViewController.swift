//
//  TasksViewController.swift
//  To Do
//
//  Created by Ty Foster on 9/15/19.
//  Copyright © 2019 Foster Coding. All rights reserved.
//

import UIKit

class TasksViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var GroupTable: UITableView!
    
    var tasks : [Task] = []
    
    var selectedIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tasks = makeTasks()
        
        GroupTable.dataSource = self
        GroupTable.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let task = tasks[indexPath.row]
        if(task.priority) {cell.textLabel?.text = "!!! \(task.name)"}
        else {cell.textLabel?.text = task.name}
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedIndex = indexPath.row
        performSegue(withIdentifier: "completeSegue", sender: tasks[indexPath.row])
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

    @IBAction func plusTapped(_ sender: Any) {
        performSegue(withIdentifier: "addSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addSegue" {
            let nextVC = segue.destination as! CreateTaskViewController
            nextVC.prevVC = self
        }
        
        if segue.identifier == "completeSegue" {
            let nextVC = segue.destination as! CompleteTaskViewController
            nextVC.task = sender as! Task
            nextVC.prevVC = self
        }
    }
}

