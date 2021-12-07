//
//  AddTimesTaskVC.swift
//  ToDo-Timer
//
//  Created by Arnav Gupta on 2021-12-08.
//

import Foundation
import UIKit
import CoreData

class AddTimedTaskVC: UIViewController {

//    @IBOutlet weak var taskField: UITextField!
//    @IBOutlet weak var datePick:UIdatePick!
//    @IBOutlet weak var importancePick:UISegmentedControl!
    
    
    @IBOutlet weak var taskField: UITextField!
    
    @IBOutlet weak var datePick: UIDatePicker!
    
    @IBOutlet weak var importancePick: UISegmentedControl!
    let userDef = UserDefaults()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    
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
    
    func createTask(n: String, imp: Int, d: Date) {
        
        let newTask = TimedTask(context: context)
        newTask.name = n
        newTask.importance = Int16(imp)
        newTask.createdAt = d
        
        do {
            try context.save()
        } catch {
            print("Error in saving new task")
        }
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func makeNew(_ sender: Any) {
        createTask(n: taskField.text!,imp: importancePick.selectedSegmentIndex + 1, d: datePick.date)
    }
    
    
    @IBAction func goBackCancel(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}
