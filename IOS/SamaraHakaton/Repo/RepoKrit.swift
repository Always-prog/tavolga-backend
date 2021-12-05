//
//  RepoKrit.swift
//  SamaraHakaton
//
//  Created by Степан Харитонов on 05.12.2021.
//

import UIKit
import Foundation

class RepoKrit {
    var kritBlock = [KritStud]()
    
    init() {
        setupArray()
    }
    
    func setupArray() {
        
        let krit1 = KritStud(nameKrit: "Представление участника конкурса", infoUser: "Участником предоставлены полная анкета.", uslKrit: "Параметры критериев:   Ничего нет - 0   Представлено частично - 1   Представлено краткая информация - 2    Заполнено с лихвой - 3", maxScore: 3)
        let krit2 = KritStud(nameKrit: "Информативность", infoUser: "Участником дан абсолютно развернутый ответ", uslKrit: "Параметры критериев:   Ничего нет - 0   Представлено частично - 1   Представлено краткая информация - 2    Заполнено с лихвой - 3", maxScore: 3)
        let krit3 = KritStud(nameKrit: "Видеопрезентация", infoUser: "Подготовлена качественная презентация", uslKrit: "Параметры критериев:   Ничего нет - 0   Представлено частично - 1   Представлено краткая информация - 2    Заполнено с лихвой - 3", maxScore: 3)
        let krit4 = KritStud(nameKrit: "Достижения за год", infoUser: "Большой послужной список", uslKrit: "Параметры критериев:   Ничего нет - 0   Представлено частично - 1   Представлено краткая информация - 2    Заполнено с лихвой - 3", maxScore: 3)
        
        kritBlock.append(krit1)
        kritBlock.append(krit2)
        kritBlock.append(krit3)
        kritBlock.append(krit4)
        
    }

}
