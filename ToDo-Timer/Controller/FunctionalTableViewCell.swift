//
//  FunctionalTableViewCell.swift
//  ToDo-Timer
//
//  Created by Ajith Kusalakumar on 2021-11-25.
//

import UIKit

class FunctionalTableViewCell: UITableViewCell {
    @IBOutlet weak var taskName: UILabel!
    @IBOutlet weak var taskDate: UILabel!
    @IBOutlet weak var taskDone: UISwitch!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
