//
//  ToDoListsNameCellCollectionViewCell.swift
//  ToDo-Timer
//
//  Created by Ajith Kusalakumar on 2021-11-22.
//

import UIKit

class ToDoListsNameCellCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var labelText: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        labelText?.text = "test"
    }
    
    func configure(name: String){
        labelText?.text = name
    }

}
