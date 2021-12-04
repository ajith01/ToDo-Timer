//
//  ThemeViewController.swift
//  ToDo-Timer
//
//  Created by Arnav Gupta on 2021-11-29.
//

import Foundation
import UIKit

class ThemeViewController: UIColorPickerViewController {
    
    @IBOutlet var selectButton: UIButton!
    
    @IBAction func selectTheme(_ sender: Any) {

        let picker = UIColorPickerViewController()
        picker.selectedColor = self.view.backgroundColor!
        picker.delegate = self
        self.present(picker, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    


}

extension ThemeViewController: UIColorPickerViewControllerDelegate {
    
//      Called once you have finished picking the color.
    func colorPickerViewControllerDidFinish(_ viewController: UIColorPickerViewController) {
        self.view.backgroundColor = viewController.selectedColor
        print(viewController.selectedColor)
    }

    //  Called on every color selection done in the picker.
    func colorPickerViewControllerDidSelectColor(_ viewController: UIColorPickerViewController) {
            self.view.backgroundColor = viewController.selectedColor
        print(viewController.selectedColor)
    }

    func colorPickerViewController(_ viewController: UIColorPickerViewController, didSelect color: UIColor, continuously: Bool) {
        print(color)
    }

}
