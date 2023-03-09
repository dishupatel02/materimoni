//
//  NameTableViewCell.swift
//  Metrimony
//
//  Created by disha patel on 23/11/22.
//

import UIKit

class NameTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var namelogo: UIImageView!
    
    @IBOutlet weak var profilename: UILabel!
    
    
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
