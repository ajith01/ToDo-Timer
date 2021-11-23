//
//  LabelCollectionView.swift
//  ToDo-Timer
//
//  Created by Ajith Kusalakumar on 2021-11-22.
//

import UIKit

class LabelCollectionView: UICollectionViewCell {
    @IBOutlet weak var label:UILabel!
    
    func configure(name:String){
        label.text = name
    }
}
