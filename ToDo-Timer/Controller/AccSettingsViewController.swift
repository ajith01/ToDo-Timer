//
//  AccSettingsController.swift
//  ToDo-Timer
//
//  Created by Arnav Gupta on 2021-11-29.
//

import Foundation
import UIKit

class AccSettingsViewController: UIViewController {
    
//    @IBOutlet var settingsTable: UITableView!
    @IBOutlet var saveButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        settingsTable.delegate = self
//        settingsTable.dataSource = self
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
