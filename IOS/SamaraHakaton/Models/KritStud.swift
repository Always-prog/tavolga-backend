//
//  KritStud.swift
//  SamaraHakaton
//
//  Created by Степан Харитонов on 04.12.2021.
//

import UIKit
import Foundation

class KritStud {

    var nameKrit: String
    var infoUser: String
    var uslKrit: String
    var maxScore: Int
    
    init(nameKrit: String, infoUser: String , uslKrit: String, maxScore: Int) {
        self.nameKrit = nameKrit
        self.infoUser = infoUser
        self.uslKrit = uslKrit
        self.maxScore = maxScore
    }
}
