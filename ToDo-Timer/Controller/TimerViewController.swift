//
//  TimerViewController.swift
//  ToDo-Timer
//
//  Created by Ajith Kusalakumar on 2021-11-10.
//

import Foundation
import UIKit
class TimerViewController: UIViewController {
    
    var todoViewController:NewToDoListViewController?
    @IBOutlet weak var taskName: UITextField!
    @IBOutlet weak var timer: UIDatePicker!

    var currentToDoList = 0
    var currToDoListName = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

}
