//
//  CreatTaskViewController.swift
//  ToDooo
//
//  Created by Jan Ghods on 19.09.16.
//  Copyright © 2016 Jan Ghods. All rights reserved.
//

import UIKit

class CreatTaskViewController: UIViewController {

    @IBOutlet weak var taskNameTextField: UITextField!
    
    
    @IBOutlet weak var importantSwitch: UISwitch!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func addTapped(_ sender: AnyObject) {
        
        //Creat Task from outlet information
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

        
        let task = Task(context: context)
        task.name = taskNameTextField.text!
        task.important = importantSwitch.isOn
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        
        //Pop Back
        
        navigationController!.popViewController(animated: true)
    }

    
    


}
