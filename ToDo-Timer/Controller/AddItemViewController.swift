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
    
    let userDef = UserDefaults()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var currentToDoList:Int  = 0
    var currToDoListName: String = ""
//    let viewControler = ToDoListViewController()
    
    var todoViewController:NewToDoListViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

       
    }
    override func viewWillAppear(_ animated: Bool) {
        if let val = userDef.value(forKey: "mainColor") as? Array<CGFloat> {
            self.view.backgroundColor = UIColor(red: val[0], green: val[1], blue: val[2], alpha: 1.0)
        } else {
            print("error while loading main color")
        }
    }
    
//    func createTask(n: String, imp: Int, d: Date) {
//        print("asd xxasxx \(n) \(imp) \(d)")
//        let newTask = ToDoItem(context: context)
//        newTask.name = n
//        newTask.importance = Int16(imp)
//        newTask.createdAt = d
//        newTask.listName = currToDoListName
//        do {
//            try context.save()
//        } catch {
//            print("Error in saving new task")
//        }
//    }
//
//    func addItemToToDoList(task:String,taskImpe:Importance, taskdate:Date){
//
//        createTask(n: task, imp: taskImpe.rawValue, d: taskdate)
//    }
    
    @IBAction func saveButtonPressed(_ sender:UIButton){
        //TO:DO deal with optionals

//        
//
//        todoViewController?.addItemToToDoList( task: taskNameField.text!,taskImpe: importancePicker.selectedSegmentIndex, taskdate: datePicker.date)
//

//        print("slectedted: ",  importancePicker.selectedSegmentIndex)
        todoViewController?.addItemToToDoList( task: taskNameField.text!,taskImpe: Importance(rawValue: importancePicker.selectedSegmentIndex + 1)!, taskdate: datePicker.date)

        navigationController?.popViewController(animated: true)
        //        viewControler.toDoLists[viewControler.currentToDoList].toDoListHolder.append(ToDoListItem(taskName: taskNameField.text, taskImportance:Importance(rawValue: importancePicker.selectedSegmentIndex),date: datePicker.date))

        
        
    }

}
