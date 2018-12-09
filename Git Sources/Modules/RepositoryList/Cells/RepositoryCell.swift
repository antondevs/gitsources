//
//  RepositoryCell.swift
//  Git Sources
//
//  Created by Anton Nadtoka on 08/12/2018.
//  Copyright © 2018 Anton Nadtoka. All rights reserved.
//

import UIKit

class RepositoryCell: UITableViewCell {
    
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelUser: UILabel!
    @IBOutlet weak var labelCounter: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }
    
    func setupData(item:Item) {
        labelName.text = item.fullName ?? "No name"
        labelCounter.text = String.init(describing: item.stargazersCount ?? 0)
        
        if let owner = item.owner {
            labelUser.text = owner.login ?? "Unknown"
        }
        else {
            labelUser.text = "Unknown"
        }
    }
    
}
