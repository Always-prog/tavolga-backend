//
//  InfoView.swift
//  SamaraHakaton
//
//  Created by Степан Харитонов on 04.12.2021.
//

import UIKit

class InfoView: UIViewController {

    @IBOutlet weak var smallInfo: UILabel!
    @IBOutlet weak var roleUser: UILabel!
    @IBOutlet weak var workName: UILabel!
    @IBOutlet weak var backPhotoView: UIView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var photo: UIImageView!
    @IBOutlet weak var firstName: UILabel!
    @IBOutlet weak var gradView: UIView!
    var numbers = RepoMain()
    var visualEffectView: UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        settingsView()
        mainGradient()
        ShowLoginError()
    }
    
    func settingsView() {
        backPhotoView.layer.cornerRadius = backPhotoView.frame.height/2
        photo.layer.cornerRadius = backPhotoView.layer.cornerRadius
        photo.image = UIImage(named: "Александр")
        backPhotoView.layer.shadowColor = UIColor.black.cgColor
        backPhotoView.layer.shadowOffset = CGSize.zero
        backPhotoView.layer.shadowRadius = 10
        backPhotoView.layer.shadowOpacity = 0.7
        name.text = MainView.lastName
        firstName.text = MainView.firstName
        roleUser.text = MainView.role
        smallInfo.text = MainView.aboutText
    }
    
    func mainGradient() {
    let mainGradnt = CAGradientLayer()
        mainGradnt.colors = [UIColor.clear.cgColor, UIColor.init(displayP3Red: 5/255, green: 24/255, blue: 161/255, alpha: 1.0).cgColor]
        mainGradnt.locations = [ 0 as NSNumber, 0.6 as NSNumber]
        mainGradnt.startPoint = CGPoint.init(x: 0, y: 0)
        mainGradnt.endPoint = CGPoint(x: 0.0, y: 1.0)
        gradView.layer.insertSublayer(mainGradnt, at: 0)
        mainGradnt.frame = gradView.bounds
    }
    
    func blurMotion() {
            let blurEffect = UIBlurEffect(style: .dark)
            let visualEffectView = UIVisualEffectView(effect: blurEffect)
            visualEffectView.frame = self.view.frame
            self.view.addSubview(visualEffectView)
            self.visualEffectView = visualEffectView
            visualEffectView.alpha = 1
            UIView.transition(
                with: self.view,
                duration: 0.3,
                options: [.transitionCrossDissolve],
                animations: { [weak self] in
            self?.view.addSubview(visualEffectView)},
                completion: nil)
    }
    
    func ShowLoginError() {
        let alert = UIAlertController(title: "УВАЖАЕМЫЙ АСЕССОР", message: "Оцените участников до 14 декабря", preferredStyle: .alert)
           
           let actionalert = UIAlertAction(
            title: "Всё понятно",
            style: .cancel,
            handler: {_ in UIView.animate(withDuration: 0.3, animations: {[weak self] in self?.visualEffectView?.alpha = 0})} )
            alert.addAction(actionalert)
            blurMotion()
           present(alert, animated: true, completion: nil)
    }
    
    @IBAction func dismissAction(_ sender: Any) {
    }
    
}
