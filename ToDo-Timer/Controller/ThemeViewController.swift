//
//  ThemeViewController.swift
//  ToDo-Timer
//
//  Created by Arnav Gupta on 2021-11-29.
//

import Foundation
import UIKit

class ThemeViewController: UIViewController {
    
    let userDef = UserDefaults()
    let colorVC = UIColorPickerViewController()
    var currButtonTag = 0
    
    @IBOutlet weak var selectMainButton: UIButton!
    
    @IBOutlet weak var lowB: UIButton!
    @IBOutlet weak var medB: UIButton!
    @IBOutlet weak var highB: UIButton!
    @IBOutlet weak var impB: UIButton!

    @IBAction func pickPriorityColor(_ sender: Any) {
        
        guard let button = sender as? UIButton else {
                return
            }
        switch button.tag {
        case 0: currButtonTag = 0
        case 1: currButtonTag = 1
        case 2: currButtonTag = 2
        case 3:
            currButtonTag = 3
        case 4:
            currButtonTag = 4
        default:
            print("Unknow Click Trigger")
            return
        }
        
        present(colorVC, animated: true)
        
    }
//    @IBAction func selectTheme(_ sender: Any) {

//        let picker = UIColorPickerViewController()
//        picker.selectedColor = self.view.backgroundColor!
//        picker.delegate = self
//        self.present(picker, animated: true, completion: nil)
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        colorVC.delegate = self
//        present(colorVC, animated: true)
        
        if let val = userDef.value(forKey: "mainColor") as? Array<CGFloat> {
            self.view.backgroundColor = UIColor(red: val[0], green: val[1], blue: val[2], alpha: 1.0)
        } else {
            print("error while loading main color")
        }
        

    }
    
    override func viewWillAppear(_ animated: Bool) {
//        var val = userDef.value(forKey: "medColor") as? Array<CGFloat>
//        print("why", val)
//        val = userDef.value(forKey: "medColor") as? Array<CGFloat>
//        print("why", val)
//        val = userDef.value(forKey: "highColor") as? Array<CGFloat>
//        print("why", val)
//        val = userDef.value(forKey: "impColor") as? Array<CGFloat>
//        print("why", val)
                if let val = userDef.value(forKey: "lowColor") as? Array<CGFloat> {
                    lowB.tintColor = UIColor(red: val[0], green: val[1], blue: val[2], alpha: 1.0)
                } else {
                    lowB.tintColor = UIColor.gray
                    print("error while loading main color")
                }
        
                if let val = userDef.value(forKey: "medColor") as? Array<CGFloat> {
                    medB.tintColor = UIColor(red: val[0], green: val[1], blue: val[2], alpha: 1.0)
                } else {
                    medB.tintColor = UIColor.yellow
                    print("error while loading main color")
                }
        
                if let val = userDef.value(forKey: "highColor") as? Array<CGFloat> {
                    highB.tintColor = UIColor(red: val[0], green: val[1], blue: val[2], alpha: 1.0)
                } else {
                    highB.tintColor = UIColor.orange
                    print("error while loading main color")
                }
        
                if let val = userDef.value(forKey: "impColor") as? Array<CGFloat> {
                    impB.tintColor = UIColor(red: val[0], green: val[1], blue: val[2], alpha: 1.0)
                } else {
                    impB.tintColor = UIColor.red
                    print("error while loading main color")
                }
    }
        
    
    func saveThisKeyColor(color: UIColor) {
        let comp = color.cgColor.components!
        print(comp)
        switch currButtonTag {
        case 0:
            userDef.set(comp, forKey: "mainColor")
        case 1:
            userDef.set(comp, forKey: "lowColor")
        case 2:
            userDef.set(comp, forKey: "medColor")
        case 3:
            userDef.set(comp, forKey: "highColor")
        case 4:
            userDef.set(comp, forKey: "impColor")
        default:
            print("internal issue didnt select correct thing")
            
        }
    }

}

extension ThemeViewController: UIColorPickerViewControllerDelegate {
    
//      Called once you have finished picking the color.
    func colorPickerViewControllerDidFinish(_ viewController: UIColorPickerViewController) {
        let mycol = viewController.selectedColor
        switch currButtonTag {
        case 0: break
        case 1:
            lowB.tintColor = mycol
        case 2:
            medB.tintColor = mycol
        case 3:
            highB.tintColor = mycol
        case 4:
            impB.tintColor = mycol
        default:
            print("internal issue didnt select correct thing")
            
        }
        saveThisKeyColor(color: viewController.selectedColor)
    }

    //  Called on every color selection done in the picker.
    func colorPickerViewControllerDidSelectColor(_ viewController: UIColorPickerViewController) {
        if(currButtonTag == 0){
            self.view.backgroundColor = viewController.selectedColor
        }
        
//        print(viewController.selectedColor)
    }


}

//extension UIColor {
//    convenience init(red: Int, green: Int, blue: Int) {
//        let newRed = CGFloat(red)/255
//        let newGreen = CGFloat(green)/255
//        let newBlue = CGFloat(blue)/255
//
//        self.init(red: newRed, green: newGreen, blue: newBlue, alpha: 1.0)
//    }
//}
