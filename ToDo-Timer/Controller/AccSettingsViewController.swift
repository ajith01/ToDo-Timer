//
//  AccSettingsController.swift
//  ToDo-Timer
//
//  Created by Arnav Gupta on 2021-11-29.
//

import Foundation
import UIKit

class AccSettingsViewController: UIViewController, UITextFieldDelegate {
    
//    @IBOutlet var settingsTable: UITableView!
    @IBOutlet var saveButton: UIButton!
    @IBOutlet weak var usrnmField: UITextField!
    
    @IBOutlet weak var emField: UITextField!
    
    @IBOutlet weak var passField: UITextField!
    
    let userDef = UserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let val = userDef.value(forKey: "username") as? String {
            
            usrnmField.text = val
        }
        if let val = userDef.value(forKey: "useremail") as? String {
            
            emField.text = val
        }
        if let val = userDef.value(forKey: "userpass") as? String {
            
            passField.text = val
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let val = userDef.value(forKey: "mainColor") as? Array<CGFloat> {
            self.view.backgroundColor = UIColor(red: val[0], green: val[1], blue: val[2], alpha: 1.0)
        } else {
            print("error while loading main color")
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        usrnmField.resignFirstResponder()
        emField.resignFirstResponder()
        passField.resignFirstResponder()
        return true
    }
    
    @IBAction func savePressed(_ sender: Any) {
        
        userDef.setValue(usrnmField.text, forKey: "username")
        
        userDef.setValue(emField.text, forKey: "useremail")
        
        userDef.setValue(passField.text, forKey: "userpass")
        
    }
    
}

//extension AccSettingsViewController:UITableViewDataSource{
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 2
//    }
//
////    func numberOfSections(in tableView: UITableView) -> Int {
////        return 2
////    }
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "Account", for: indexPath)
//
////        cell.textLabel?.text = settingsOptions[indexPath.row]
//        return cell
//    }
//}

//extension AccSettingsViewController:UIViewDelegate{
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print("clicked settings cell")
//        tableView.deselectRow(at: indexPath, animated: true)
//    }
//}
