//
//  ViewController.swift
//  ToDo-Timer
//
//  Created by Ajith Kusalakumar on 2021-10-23.
//

import UIKit

class ToDoListViewController: UIViewController {

    @IBOutlet weak var toDoTableView: UITableView!
    @IBOutlet weak var toDoCollectionView: UICollectionView!
    
    //we want to display all the todo lists at the top
    //we want a list of todo lists which can be chosen from the top in the collectionview
    //the tasks in that list will be displayed in the tableview
    var toDoLists = [ToDoList]()
    var currentToDoList = 0 //indicates which ToDo list item is selected
    
    let dateFormatter = DateFormatter()

    
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
        
        toDoLists[0].toDoListHolder.append(ToDoListItem(taskName: "Task 1", taskImportance: Importance.low, date: Date.now))
        toDoLists[0].toDoListHolder.append(ToDoListItem(taskName: "Task 2", taskImportance: Importance.low, date: Date.now,complete: true))
        toDoLists[1].toDoListHolder.append(ToDoListItem(taskName: "Task 3", taskImportance: Importance.low, date: Date.now))
        toDoLists[2].toDoListHolder.append(ToDoListItem(taskName: "Task 4", taskImportance: Importance.low, date: Date.now))
        toDoLists[2].toDoListHolder.append(ToDoListItem(taskName: "Task 4", taskImportance: Importance.low, date: Date.now, complete: true))
        toDoLists[3].toDoListHolder.append(ToDoListItem(taskName: "Task 4", taskImportance: Importance.low, date: Date.now))


        toDoCollectionView.reloadData()
        


    }

    @IBAction func addButtonPressed(_ sender: Any) {
        let vc = AddItemViewController()
        vc.currentToDoList = currentToDoList
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func deleteButtonPressed(_ sender:UIButton){
        let pointer = sender.convert(CGPoint.zero, to: toDoTableView)
        guard let indexpath = toDoTableView.indexPathForRow(at: pointer) else {return}
        toDoLists[currentToDoList].toDoListHolder.remove(at:indexpath.row)
        
        toDoTableView.beginUpdates()
        toDoTableView.deleteRows(at: [IndexPath(row: indexpath.row, section: 0)], with: .right)
        
        toDoTableView.endUpdates()
    }
    
    @IBAction func taskCompletionChanged(_ sender:UISwitch){
        let pointer = sender.convert(CGPoint.zero, to: toDoTableView)
        guard let indexpath = toDoTableView.indexPathForRow(at: pointer) else {return}
        toDoLists[currentToDoList].toDoListHolder[indexpath.row].complete = true

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is AddItemViewController{
            let vc = segue.destination as? AddItemViewController
            vc?.todoViewController = self
//            vc?.currentToDoList = currentToDoList
            
        }
    }
    
    func addItemToToDoList(task:String,taskImpe:Importance, taskdate:Date){
        toDoLists[currentToDoList].toDoListHolder.append(ToDoListItem(taskName: task , taskImportance:taskImpe ,date:taskdate ))
        toDoTableView.reloadData()
    }
    
    @IBAction func addToDoList(_ sender: UIButton) {
        print("Button Pressed")
        
        var textField = UITextField()
        let alert = UIAlertController(title: "Create a new todo list", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add a ToDo List", style: .default){
            (action) in
            let toDoList = ToDoList(name: textField.text!)
            
            self.toDoLists.append(toDoList)
            self.toDoCollectionView.reloadData()
            self.toDoCollectionView.scrollToItem(at: IndexPath(row: self.toDoLists.count-1, section: 0), at: .left, animated: true)
            self.currentToDoList = self.toDoLists.count-1
            self.toDoTableView.reloadData()
        }
        
        alert.addTextField{(alertTextField) in alertTextField.placeholder = "Create new Item"
            textField = alertTextField
        }
        
        alert.addAction(action)
        
        present(alert,animated: true,completion: nil)
        
    }
    

}

extension ToDoListViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoLists[currentToDoList].toDoListHolder.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath) as! FunctionalTableViewCell
        
        cell.taskName.text = toDoLists[currentToDoList].toDoListHolder[indexPath.row].taskName
        cell.taskDate.text = dateFormatter.string(from:toDoLists[currentToDoList].toDoListHolder[indexPath.row].date!)
        
        cell.taskDone.setOn(toDoLists[currentToDoList].toDoListHolder[indexPath.row].complete, animated: true)
        
        return cell
    }
}

extension ToDoListViewController:UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //
    }
}


extension ToDoListViewController:UICollectionViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return toDoLists.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionToDoLists", for: indexPath) as! LabelCollectionView

        cell.configure(name: toDoLists[indexPath.row].name)

        return cell
    }
}

extension ToDoListViewController:UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //once selected display the todo list in the collection view
        collectionView.deselectItem(at: indexPath, animated: true)
        currentToDoList = indexPath.row
        toDoTableView.reloadData()
        
    }
}




//extension  ToDoListViewController:UICollectionViewFlowLayout{
//
//}


