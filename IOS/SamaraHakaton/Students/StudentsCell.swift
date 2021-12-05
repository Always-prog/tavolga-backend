//
//  StudentsCell.swift
//  SamaraHakaton
//
//  Created by Степан Харитонов on 04.12.2021.
//

import UIKit

class StudentsCell: UITableViewCell {

    @IBOutlet weak var backStudView: UIView!
    @IBOutlet weak var avatarStud: UIImageView!
    @IBOutlet weak var nameStud: UILabel!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
