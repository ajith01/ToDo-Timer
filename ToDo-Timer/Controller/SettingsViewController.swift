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
    let userDef = UserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        settingsTable.delegate = self
        settingsTable.dataSource = self
        
    }
    override func viewWillAppear(_ animated: Bool) {
        if let val = userDef.value(forKey: "mainColor") as? Array<CGFloat> {
            self.view.backgroundColor = UIColor(red: val[0], green: val[1], blue: val[2], alpha: 1.0)
        } else {
            print("error while loading main color")
        }
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
