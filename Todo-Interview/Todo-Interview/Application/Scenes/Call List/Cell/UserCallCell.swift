//
//  UserCallCell.swift
//  Todo-Interview
//
//  Created by Dat Van on 05/08/2022.
//

import UIKit

class UserCallCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func config(user: User) {
        nameLabel.text = "Name: \(user.name)"
        phoneLabel.text = "Number: \(user.number)"
    }
    
}
