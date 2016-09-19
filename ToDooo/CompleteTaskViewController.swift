//
//  CompleteTaskViewController.swift
//  ToDooo
//
//  Created by Jan Ghods on 19.09.16.
//  Copyright © 2016 Jan Ghods. All rights reserved.
//

import UIKit

class CompleteTaskViewController: UIViewController {
    
    @IBOutlet weak var taskLabel: UILabel!
    var task = Task()
    var previousVC = TasksViewController()

    override func viewDidLoad() {
        super.viewDidLoad()

        
        if task.important{
            taskLabel.text = " ❗️\(task.name)"
            
        }else {
            taskLabel.text = task.name
        }
    }
    

    @IBAction func completeTabbed(_ sender: AnyObject) {
        previousVC.tasks.remove(at: previousVC.selectIndex)
        previousVC.tableView.reloadData()
        navigationController!.popViewController(animated: true)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
