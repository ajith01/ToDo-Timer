//
//  AddItemViewController.swift
//  ToDo-Timer
//
//  Created by Ajith Kusalakumar on 2021-11-10.
//

import Foundation
import UIKit
class AddItemViewController: UIViewController {

    @IBOutlet weak var taskNameField: UITextField!
    @IBOutlet weak var datePicker:UIDatePicker!
    @IBOutlet weak var importancePicker:UISegmentedControl!
    
    var currentToDoList:Int  = 0
//    let viewControler = ToDoListViewController()
    
    var todoViewController:ToDoListViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

    }
    
    @IBAction func saveButtonPressed(_ sender:UIButton){
        //TO:DO deal with optionals
        
        
        todoViewController?.addItemToToDoList( task: taskNameField.text!,taskImpe: importancePicker.selectedSegmentIndex, taskdate: datePicker.date)
        
        navigationController?.popViewController(animated: true)
        //        viewControler.toDoLists[viewControler.currentToDoList].toDoListHolder.append(ToDoListItem(taskName: taskNameField.text, taskImportance:Importance(rawValue: importancePicker.selectedSegmentIndex),date: datePicker.date))

        
        
    }

}
