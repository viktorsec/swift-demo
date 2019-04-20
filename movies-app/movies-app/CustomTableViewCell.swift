//
//  CustomTableViewCell.swift
//  movies-app
//
//  Created by Viktor Sec on 21/04/2019.
//  Copyright © 2019 Viktor Sec. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    @IBOutlet var movieImageView: UIImageView!
    @IBOutlet var movieTitle: UILabel!
    @IBOutlet var movieYear: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
