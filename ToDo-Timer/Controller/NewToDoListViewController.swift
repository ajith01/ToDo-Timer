//
//  NewToDoListViewController.swift
//  ToDo-Timer
//
//  Created by Arnav Gupta on 2021-12-06.
//
//
//  ViewController.swift
//  ToDo-Timer
//
//  Created by Ajith Kusalakumar on 2021-10-23.
//

import Foundation
import UIKit
import CoreData

class NewToDoListViewController: UIViewController {

    @IBOutlet weak var toDoTableView: UITableView!
    @IBOutlet weak var toDoCollectionView: UICollectionView!
    
    //we want to display all the todo lists at the top
    //we want a list of todo lists which can be chosen from the top in the collectionview
    //the tasks in that list will be displayed in the tableview
    var toDoLists = [ToDoList]()
    var currentToDoList = 0 //indicates which ToDo list item is selected
    
    let dateFormatter = DateFormatter()
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    let userDef = UserDefaults()
    var mainColor = [CGFloat]()
    var lowC = [CGFloat]()
    var medC = [CGFloat]()
    var highC = [CGFloat]()
    var impC = [CGFloat]()
    
    private var allTasks = [ToDoItem]()
    private var allTodoLists = [MyList]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//        toDoTableView.register(UINib(nibName: "CustomToDoListCell", bundle: nil), forCellReuseIdentifier: "ToDoItemCell")
        
        toDoTableView.dataSource = self
        toDoTableView.delegate = self
        
        toDoCollectionView.dataSource = self
        toDoCollectionView.delegate = self

        
        dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
        dateFormatter.dateFormat = "yyyy-MM-dd hh:mm:ss"
        
        //going to hard code some todo lists
        toDoLists.append(ToDoList(name: "Daily"))
        toDoLists.append(ToDoList(name: "Weekly"))
        toDoLists.append(ToDoList(name: "Monthly"))
        toDoLists.append(ToDoList(name: "Project 1"))
        toDoLists.append(ToDoList(name: "Project 2"))
        
        
        //adding to do list items
        
//        toDoLists[0].toDoListHolder.append(ToDoListItem(taskName: "Task 1", taskImportance: Importance.low, date: Date.now))
//        toDoLists[0].toDoListHolder.append(ToDoListItem(taskName: "Task 2", taskImportance: Importance.low, date: Date.now,complete: true))
//        toDoLists[1].toDoListHolder.append(ToDoListItem(taskName: "Task 3", taskImportance: Importance.low, date: Date.now))
//        toDoLists[2].toDoListHolder.append(ToDoListItem(taskName: "Task 4", taskImportance: Importance.low, date: Date.now))
//        toDoLists[2].toDoListHolder.append(ToDoListItem(taskName: "Task 4", taskImportance: Importance.low, date: Date.now, complete: true))
//        toDoLists[3].toDoListHolder.append(ToDoListItem(taskName: "Task 4", taskImportance: Importance.low, date: Date.now))

        
//        toDoCollectionView.reloadData()
        
        getAllLists()
        getAllTasks()


    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let val = userDef.value(forKey: "mainColor") as? Array<CGFloat> {
            self.view.backgroundColor = UIColor(red: val[0], green: val[1], blue: val[2], alpha: 1.0)
            mainColor = val
            toDoTableView.backgroundColor = UIColor(red: val[0], green: val[1], blue: val[2], alpha: 0.8)
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
        
        reloadTableView()
        reloadCollectoinView()
        
    }
    
    func reloadTableView() {
        DispatchQueue.main.async {
            self.toDoTableView.reloadData()
        }
    }
    
    func reloadCollectoinView() {
        DispatchQueue.main.async {
            self.toDoCollectionView.reloadData()
        }
    }
    
    func getAllTasks() {
        do {
            allTasks = try context.fetch(ToDoItem.fetchRequest())
        } catch {
            print("Error when getting all tasks")
        }
        
        reloadTableView()
        
    }
    func getAllLists() {
        do {
            let all = try context.fetch(MyList.fetchRequest())
            if(all.count < 1) {
                createToDoList(name: "ToDos")
            }
            else {
                allTodoLists = all
            }
        } catch {
            print("Error when getting all List categories")
        }
        
        reloadCollectoinView()
    }
    
    func createToDoList(name: String) {
        let newList = MyList(context: context)
        newList.name = name
       //        newTask.importance = importance
       //        newTask.createdAt = createdAt
       //        newTask.listName = listName
       //        newTask.completed = completed
               do {
                   try context.save()
               } catch {
                   print("Error in saving new List category")
               }
        getAllLists()
    }
    
    func createTask(n: String, imp: Int, d: Date) {
        
        let newTask = ToDoItem(context: context)
               newTask.name = n
               newTask.importance = Int16(imp)
        newTask.createdAt = d
        newTask.listName = allTodoLists[currentToDoList].name!
        print("createing" + newTask.listName!)
        do {
            try context.save()
        } catch {
            print("Error in saving new task")
        }
    }
    
    func deleteTask(task: ToDoItem) {
        context.delete(task)
        do {
            try context.save()
        } catch {
            print("Error in delete task")
        }
        
        getAllTasks()
    }
    
    func updateTask(task: ToDoItem) {
        task.name = task.name ?? "Empty Name! +" + "got updated!"
        do {
            try context.save()
        } catch {
            print("Error in udpating task ")
        }
    }
    func updateTaskChangeComplete(task: ToDoItem) {

        print("saved it man \(task.completed)")
        task.completed.toggle()
        print("saved it man2 \(task.completed)")
        do {
            try context.save()
            print("saved it manokkk")
        } catch {
            print("Error in udpating task ")
        }
    }

    @IBAction func addButtonPressed(_ sender: Any) {
        let vc = AddItemViewController()
        vc.currentToDoList = currentToDoList
        vc.currToDoListName = allTodoLists[currentToDoList].name!
        navigationController?.pushViewController(vc, animated: true)
//        reloadTableView()
    }
    
    @IBAction func deleteButtonPressed(_ sender:UIButton){
        
        let pointer = sender.convert(CGPoint.zero, to: toDoTableView)
        guard let indexpath = toDoTableView.indexPathForRow(at: pointer) else {return}
//        toDoTableView.beginUpdates()
        
        let rem = getMatching()
        deleteTask(task: rem[indexpath.row])
//        print(rem[indexpath.row])
//        print("cliecked here \(indexpath)")
        
//        toDoTableView.endUpdates()
    }
    
    @IBAction func taskCompletionChanged(_ sender:UISwitch){
        let pointer = sender.convert(CGPoint.zero, to: toDoTableView)
        guard let indexpath = toDoTableView.indexPathForRow(at: pointer) else {return}
//        toDoLists[currentToDoList].toDoListHolder[indexpath.row].complete = true
        let rem = getMatching()
        updateTaskChangeComplete(task: rem[indexpath.row])

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is AddItemViewController{
            let vc = segue.destination as? AddItemViewController
            vc?.todoViewController = self
            vc?.currentToDoList = currentToDoList
            vc?.currToDoListName = allTodoLists[currentToDoList].name!
        }
    }
    
    func addItemToToDoList(task:String,taskImpe:Importance, taskdate:Date){
        createTask(n: task, imp: taskImpe.rawValue, d: taskdate)
        getAllTasks()
        
    }
    
    @IBAction func addToDoList(_ sender: UIButton) {
        print("Button for Making new To Do List")
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Create a New ToDo list", message: "Make new Task Category", preferredStyle: .alert)
    
        let action = UIAlertAction(title: "Add a ToDo List", style: .default){
            (action) in
//            let toDoList = ToDoList(name: textField.text!)
//            if(textField.text! != ""){
            self.createToDoList(name: textField.text!)
//            } else {
//                self.createToDoList(name: "not provided")
//            }
//            self.toDoLists.append(toDoList)
//            self.toDoCollectionView.reloadData()
//            print("reached1")
            self.reloadTableView()
            
//            self.toDoCollectionView.scrollToItem(at: IndexPath(row: self.allTodoLists.count-1, section: 0), at: .left, animated: true)
            
//            self.currentToDoList = self.allTodoLists.count-1
            self.reloadCollectoinView()
//            self.toDoTableView.reloadData()
        }
        
        alert.addTextField{(alertTextField) in alertTextField.placeholder = "Create new Item"
            textField = alertTextField
        }
        
        alert.addAction(action)
        
        present(alert,animated: true,completion: nil)
        
    }
    

}

extension NewToDoListViewController:UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        print("name CONTAINS '\(allTodoLists[currentToDoList].name!)'")
//        print(allTodoLists[currentToDoList].name!, " heheq3ods ->\(currentToDoList)")
        let rem = getMatching()
        return rem.count
        //toDoLists[currentToDoList].toDoListHolder.count
        
//        let listMatch = toDoLists[currentToDoList]
//        let remaining = allTasks.filter({ t in return t.name! == listMatch
//
//        }) //{$0.name == listMatch}
//        return remaining.count
        
    }
    
    func getMatching() -> Array<ToDoItem> {
        do {
            if(allTodoLists.count > 0){
                let req = ToDoItem.fetchRequest() as NSFetchRequest

                let pred = NSPredicate(format: "listName CONTAINS '\(allTodoLists[currentToDoList].name!)'")
                req.predicate = pred
                let filtered = try context.fetch(req)
                return filtered
                
            }
            else{
                return []
            }
        } catch {
            //
        }
        return []
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath) as! FunctionalTableViewCell
        let rem = getMatching()
        
        cell.taskName.text = rem[indexPath.row].name! //+ "of" + rem[indexPath.row].listName! //
        cell.taskDate.text = dateFormatter.string(from: rem[indexPath.row].createdAt!)
        
        cell.taskDone.setOn(rem[indexPath.row].completed, animated: true)
        switch rem[indexPath.row].importance {
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

extension NewToDoListViewController:UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}


extension NewToDoListViewController:UICollectionViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return toDoLists.count
        return allTodoLists.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionToDoLists", for: indexPath) as! LabelCollectionView

//        cell.configure(name: toDoLists[indexPath.row].name)
        cell.configure(name: allTodoLists[indexPath.row].name ?? "not provided")
        cell.backgroundColor = UIColor(red: mainColor[0], green: mainColor[1], blue: mainColor[2], alpha: 1.0)
        
        
        
        return cell
    }
}

extension NewToDoListViewController:UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //once selected display the todo list in the collection view
        collectionView.deselectItem(at: indexPath, animated: true)
        currentToDoList = indexPath.row
        toDoTableView.reloadData()
    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForRowAt section: Int) -> UIEdgeInsets {
//           return UIEdgeInsets(top: 25, left: 15, bottom: 0, right: 5)
//        }
    
    
}




//extension  ToDoListViewController:UICollectionViewFlowLayout{
//
//}


