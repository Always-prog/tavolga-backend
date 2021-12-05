//
//  KonkursArray.swift
//  SamaraHakaton
//
//  Created by Степан Харитонов on 04.12.2021.
//

import UIKit
import Foundation

class MainArray {

    var nameKonkurs: String
    var nameNominations: [String]
    var nameStudents: [String]

    init( nameKonkurs: String, nameNominations: [String], nameStudents: [String]) {
        self.nameKonkurs = nameKonkurs
        self.nameNominations = nameNominations
        self.nameStudents = nameStudents
    }
}
