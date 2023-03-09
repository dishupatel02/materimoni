//
//  LikeTableViewCell.swift
//  Metrimony
//
//  Created by disha patel on 23/11/22.
//

import UIKit

class LikeTableViewCell: UITableViewCell {

    
    @IBOutlet weak var Profileimage: UIImageView!
    @IBOutlet weak var Profilename: UILabel!
    @IBOutlet weak var Profiledob: UILabel!
    @IBOutlet weak var Profileeducation: UILabel!
    
//    override func awakeFromNib() {
//        super.awakeFromNib()
//
////
////        Profileimage.layer.masksToBounds = true
////        Profileimage.layer.cornerRadius = Profileimage.bounds.width/2
//    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
