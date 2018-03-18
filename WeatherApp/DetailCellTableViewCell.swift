//
//  DetailCellTableViewCell.swift
//  WeatherApp
//
//  Created by ANURAG ADARSH on 18/03/18.
//  Copyright © 2018 ANURAG ADARSH. All rights reserved.
//

import UIKit

class DetailCellTableViewCell: UITableViewCell {
        
    @IBOutlet var iconName: UILabel!
    @IBOutlet var iconView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
