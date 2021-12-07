//
//  FunctionalTimedTaskCell.swift
//  ToDo-Timer
//
//  Created by Arnav Gupta on 2021-12-08.
//

import Foundation
import UIKit

class FunctionalTimedTaskCell: UITableViewCell {
    @IBOutlet weak var taskName: UILabel!
    @IBOutlet weak var taskDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
