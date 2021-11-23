//
//  CustomToDoListCell.swift
//  ToDo-Timer
//
//  Created by Ajith Kusalakumar on 2021-11-22.
//

import UIKit

class CustomToDoListCell: UITableViewCell {
    @IBOutlet weak var taskName: UILabel!
    @IBOutlet weak var taskDate: UILabel!
    @IBOutlet weak var deleteButton: UIButton!
    @IBOutlet weak var timerButton: UIButton!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
        
}
