//
//  TasksViewController.swift
//  ToDooo
//
//  Created by Jan Ghods on 19.09.16.
//  Copyright © 2016 Jan Ghods. All rights reserved.
//

import UIKit

class TasksViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var tasks : [Task] = []
    var selectIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        tasks = makeTasks()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell ()
        let task = tasks[indexPath.row]
        if task.important{
        cell.textLabel?.text = " ❗️\(task.name)"
        
        }else {
        
        cell.textLabel?.text = task.name
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        selectIndex = indexPath.row
        let task = tasks [indexPath.row]
        performSegue(withIdentifier: "selectTaskSegue", sender: task)
    }
    
    
    func makeTasks() -> [Task] {
        let task1 = Task()
        task1.name = "Mit dem Hund spazieren"
        task1.important = false
        
        let task2 = Task()
        task2.name = "Einkaufen"
        task2.important = true
        
        let task3 = Task()
        task3.name = "Rasen mähen"
        task3.important = false
    
    
    return [task1,task2,task3]
    
    
    }

    @IBAction func plusTabbed(_ sender: AnyObject) {
        performSegue(withIdentifier: "addSegue", sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addSegue"{
        let nextVC = segue.destination as!
        CreatTaskViewController
        nextVC.previousVC = self
    }
    if segue.identifier == "selectTaskSegue"{
        let nextVC = segue.destination as!
        CompleteTaskViewController
        nextVC.task = sender as! Task
        nextVC.previousVC = self

        
    }
    }
}
