//
//  AddItemTableViewCell.swift
//  FitFix
//
//  Created by md zeyaul mujtaba rizvi on 06/11/24.
//

import UIKit

class AddItemTableViewCell: UITableViewCell {

    @IBOutlet weak var iconImageView: UIImageView!
    
    
    @IBOutlet weak var titleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
