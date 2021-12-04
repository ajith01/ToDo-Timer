//
//  SettingsViewController.swift
//  ToDo-Timer
//
//  Created by Arnav Gupta on 2021-11-14.
//

//import Foundation
import UIKit
class SettingsViewController: UIViewController {
    
    @IBOutlet var settingsTable: UITableView!
    
    let settingsOptions = ["Accounts", "Theme"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        settingsTable.delegate = self
        settingsTable.dataSource = self
    }

}

extension SettingsViewController:UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Account", for: indexPath)
        cell.textLabel?.text = settingsOptions[indexPath.row]
//        //"Set Acc Settings - txt set in settingVC file"
        return cell
    }
}

extension SettingsViewController:UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print("clicked settings cell")
        if(indexPath.row == 0) {
            self.performSegue(withIdentifier: "AccSegue", sender: self)
        }
        else if(indexPath.row == 1) {
            self.performSegue(withIdentifier: "ThemeSegue", sender: self)
        }
        else {
            
        }
        tableView.deselectRow(at: indexPath, animated: true)
//        print(indexPath.row)
    }
}
