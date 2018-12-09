//
//  ContentItemCell.swift
//  Git Sources
//
//  Created by Anton Nadtoka on 09/12/2018.
//  Copyright © 2018 Anton Nadtoka. All rights reserved.
//

import UIKit

class ContentItemCell: UITableViewCell {

    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var imageIcon: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }

    func setupData(item:ContentItem) {
        
        labelName.text = item.name ?? "No name"
        
        if let type = item.type {
            switch (type) {
            case "file":
                imageIcon.image = UIImage.init(named: "file")
            case "dir":
                imageIcon.image = UIImage.init(named: "folder")
            default:
                imageIcon.image = UIImage.init(named: "unknown")
            }
        }
        else {
            imageIcon.image = UIImage.init(named: "unknown")
        }
    }
    
}
