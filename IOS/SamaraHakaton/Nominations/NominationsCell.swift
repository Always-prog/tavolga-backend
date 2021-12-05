//
//  NominationsCell.swift
//  SamaraHakaton
//
//  Created by Степан Харитонов on 04.12.2021.
//

import UIKit

class NominationsCell: UITableViewCell {

    @IBOutlet weak var backImageView: UIView!
    @IBOutlet weak var avatarNomView: UIImageView!
    @IBOutlet weak var nameNom: UILabel!
    @IBOutlet weak var numberStud: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
