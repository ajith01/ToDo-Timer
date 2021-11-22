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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        toDoTableView.dataSource = self
        toDoCollectionView.dataSource = self
        
        //going to hard code some todo lists
        toDoLists.append(ToDoList(name: "Daily"))
        toDoLists.append(ToDoList(name: "Weekly"))
        toDoLists.append(ToDoList(name: "Monthly"))
        toDoLists.append(ToDoList(name: "Project 1"))
        toDoLists.append(ToDoList(name: "Project 2"))

        toDoCollectionView.register(UINib(nibName: "ToDoListsNameCellCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "collectionToDoLists")
        toDoCollectionView.reloadData()

    }

    @IBAction func addButtonPressed(_ sender: Any) {
        print("Button Pressed")
    }
    
}

extension ToDoListViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        
        return cell
    }
}

extension ToDoListViewController:UITableViewDelegate{
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
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionToDoLists", for: indexPath) as! ToDoListsNameCellCollectionViewCell
        
        cell.configure(name: toDoLists[indexPath.row].name)
        return cell
    }
}

extension ToDoListViewController:UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //once selected display the todo list in the collection view
    }
    
}

//extension  ToDoListViewController:UICollectionViewFlowLayout{
//
//}


