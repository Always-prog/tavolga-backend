//
//  customTableKriterii.swift
//  SamaraHakaton
//
//  Created by Степан Харитонов on 04.12.2021.
//

import UIKit

class CustomTableKriteriiCell: UITableViewCell {

    @IBOutlet weak var scoresPeople: UITextField!
    @IBOutlet weak var numberRow: UILabel!
    @IBOutlet weak var opisanie: UILabel!
    @IBOutlet weak var character: UILabel!
    @IBOutlet weak var kriterii: UILabel!
    @IBOutlet weak var buttonEnd: UIButton!
    @IBOutlet weak var mainView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
