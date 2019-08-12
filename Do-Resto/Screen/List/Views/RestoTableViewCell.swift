//
//  RestoTableViewCell.swift
//  Do-Resto
//
//  Created by adonis rumbwere on 11/8/2019.
//  Copyright © 2019 Adonis Rumbwere. All rights reserved.
//

import UIKit

class RestoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var restoImageView: UIImageView!
    @IBOutlet weak var markerImageView: UIImageView!
    @IBOutlet weak var restoNameLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
