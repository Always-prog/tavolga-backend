//
//  SvazView.swift
//  SamaraHakaton
//
//  Created by Степан Харитонов on 05.12.2021.
//

import UIKit

class SvazView: UIViewController {

    
    @IBOutlet weak var gradientView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainGradient()
        
    }
    

    func mainGradient() {
    let mainGradnt = CAGradientLayer()
        mainGradnt.colors = [UIColor.clear.cgColor, UIColor.init(displayP3Red: 3/255, green: 8/255, blue: 53/255, alpha: 0.9).cgColor]
        mainGradnt.locations = [ 0 as NSNumber, 0.6 as NSNumber]
        mainGradnt.startPoint = CGPoint.init(x: 0, y: 0)
        mainGradnt.endPoint = CGPoint(x: 0.0, y: 1.0)
        gradientView.layer.insertSublayer(mainGradnt, at: 2)
        mainGradnt.frame = gradientView.bounds
    }
}
