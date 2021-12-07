//
//  TabBarControllerForSetUp.swift
//  ToDo-Timer
//
//  Created by Arnav Gupta on 2021-12-07.
//

import Foundation
import UIKit


class TabSetUp: UITabBarController {
    
    let userDef = UserDefaults()
    
    override func viewDidLoad() {
        
        if let val = userDef.value(forKey: "mainColor") as? Array<CGFloat> {
            //
            self.view.backgroundColor = UIColor(red: val[0], green: val[1], blue: val[2], alpha: 1.0)
        } else {
            userDef.set([1.0, 1.0, 1.0, 1.0], forKey: "mainColor")
        }
        ///
        
        
        
        
        if (userDef.value(forKey: "lowColor") as? Array<CGFloat>) != nil {
            //
        } else {
            userDef.set([0.95, 0.95, 0.95, 0.95], forKey: "lowColor")
        }
        ///
    
    
        
        
        if (userDef.value(forKey: "medColor") as? Array<CGFloat>) != nil {
            //
        } else {
            userDef.set([1.0, 0.8, 0.0, 1.0], forKey: "medColor")
        }
        ///
        
        
        
        if (userDef.value(forKey: "highColor") as? Array<CGFloat>) != nil {
            //
        } else {
            userDef.set([0.30, 0.0, 1.0, 1.0], forKey: "highColor")
        }
        ///
        
        
        
        if (userDef.value(forKey: "impColor") as? Array<CGFloat>) != nil {
            //
        } else {
            userDef.set([1.0, 0.0, 0.0, 1.0], forKey: "impColor")
        }
        
        
    }
}
