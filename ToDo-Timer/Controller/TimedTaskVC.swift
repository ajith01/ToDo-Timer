//
//  TimedTaskVC.swift
//  ToDo-Timer
//
//  Created by Arnav Gupta on 2021-12-08.
//

import Foundation
import UIKit
import CoreData

class TimedTaskVC: UIViewController {

    
    @IBOutlet weak var timeTaskTable: UITableView!
    let dateFormatter = DateFormatter()
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    let userDef = UserDefaults()
    
    var mainColor = [CGFloat]()
    var lowC = [CGFloat]()
    var medC = [CGFloat]()
    var highC = [CGFloat]()
    var impC = [CGFloat]()
    
    private var allTimeTasks = [TimedTask]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        timeTaskTable.dataSource = self
        timeTaskTable.delegate = self
        
        dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
        dateFormatter.dateFormat = "yyyy-MM-dd hh:mm:ss"
        
        getallTimeTasks()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let val = userDef.value(forKey: "mainColor") as? Array<CGFloat> {
            self.view.backgroundColor = UIColor(red: val[0], green: val[1], blue: val[2], alpha: 1.0)
            mainColor = val
            timeTaskTable.backgroundColor = UIColor(red: val[0], green: val[1], blue: val[2], alpha: 0.8)
        } else {
            print("error while loading main color")
        }
        if let val = userDef.value(forKey: "lowColor") as? Array<CGFloat> {
            lowC = val
        } else {
            print("error while loading main color")
        }
        
        if let val = userDef.value(forKey: "medColor") as? Array<CGFloat> {
            medC = val
        } else {
            print("error while loading main color")
        }
        
        if let val = userDef.value(forKey: "highColor") as? Array<CGFloat> {
            highC = val
        } else {
            print("error while loading main color")
        }
        
        if let val = userDef.value(forKey: "impColor") as? Array<CGFloat> {
            impC = val
        } else {
            print("error while loading main color")
        }
        getallTimeTasks()
//        reloadTableView()
        
    }
    
    func reloadTableView() {
        DispatchQueue.main.async {
            self.timeTaskTable.reloadData()
        }
    }
    
    
    func getallTimeTasks() {
        do {
            allTimeTasks = try context.fetch(TimedTask.fetchRequest())
            print(allTimeTasks)
        } catch {
            print("Error when getting all tasks")
        }
        reloadTableView()
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
    }
    
    func deleteTask(task: TimedTask) {
        context.delete(task)
        do {
            try context.save()
        } catch {
            print("Error in delete task")
        }
        
        getallTimeTasks()
    }
    
    
    func updateTask(task: TimedTask) {
        task.name = task.name ?? "Empty Name! +" + "got updated!"
        do {
            try context.save()
        } catch {
            print("Error in udpating task ")
        }
    }
//    func updateTaskChangeComplete(task: TimedTask) {
//
//        print("saved it man \(task.completed)")
//        task.completed.toggle()
//        print("saved it man2 \(task.completed)")
//        do {
//            try context.save()
//            print("saved it manokkk")
//        } catch {
//            print("Error in udpating task ")
//        }
//    }
    
    @IBAction func showTimer(_ sender: Any) {
        let vc = TimerViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func deleteThisTask(_ sender: UIButton) {
        let pointer = sender.convert(CGPoint.zero, to: timeTaskTable)
        guard let indexpath = timeTaskTable.indexPathForRow(at: pointer) else {return}
        deleteTask(task: allTimeTasks[indexpath.row])
    }
}

extension TimedTaskVC: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allTimeTasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TimedTaskCell", for: indexPath) as! FunctionalTimedTaskCell
        
        cell.taskName.text = allTimeTasks[indexPath.row].name!
        cell.taskDate.text = dateFormatter.string(from: allTimeTasks[indexPath.row].createdAt!)
//        cell.taskDone.setOn(rem[indexPath.row].completed, animated: true)
        
        switch allTimeTasks[indexPath.row].importance {
                case 1:
            cell.backgroundColor = UIColor(red: lowC[0], green: lowC[1], blue: lowC[2], alpha: 1.0)
                case 2:
            cell.backgroundColor = UIColor(red: medC[0], green: medC[1], blue: medC[2], alpha: 1.0)
                case 3:
            cell.backgroundColor = UIColor(red: highC[0], green: highC[1], blue: highC[2], alpha: 1.0)
                case 4:
            cell.backgroundColor = UIColor(red: impC[0], green: impC[1], blue: impC[2], alpha: 1.0)
                default:
                    print("internal issue color of cell")
                    
                }
        return cell
    }
}

extension TimedTaskVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}
