//
//  MainView.swift
//  SamaraHakaton
//
//  Created by Степан Харитонов on 04.12.2021.
//

import UIKit
import Foundation


class MainView: UIViewController {

    @IBOutlet weak var gradientView: UIView!
    @IBOutlet weak var textLogin: UITextField!
    @IBOutlet weak var textPassword: UITextField!
    
    static var firstName = ""
    static var lastName = ""
    static var aboutText = ""
    static var role = ""
    var statusCode: Int?
    var visualEffectView: UIView?
    var boolSegue: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let hideKeyboardGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(hideKeyboardGesture)
        mainGradient()
        
      
    }
    
//    var json: [String: Any] = [:]
//    var label: String = ""
//
//    func urlParc() {
//
//    let jsonData = try? JSONSerialization.data(withJSONObject: json)
//
//    // create post request
//    let url = URL(string: "http://192.168.56.65:8000/ping/")!
//    var request = URLRequest(url: url)
//    request.httpMethod = "POST"
//
//    // insert json data to the request
//    request.httpBody = jsonData
//
//        let sem = DispatchSemaphore(value: 0)
//
//    let task = URLSession.shared.dataTask(with: request) { data, response, error in
//        guard let data = data, error == nil else {
//            print(error?.localizedDescription ?? "No data")
//            return
//        }
//        let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
//        if let responseJSON = responseJSON as? [String: Any] {
//            //self.json["test_username"] = responseJSON["test_username"]
//            self.json = responseJSON
//            print("\(responseJSON)")
//            self.label = self.json["test_username"] as! String
//            print("\(self.label)")
//            sem.signal()
//        }
//    }
//    task.resume()
//        sem.wait()
//
//    }
//
//    func parc2() {
//         self.mainLabel.text = self.label as! String
//    }

    
    
//   func CheckUserData() -> Bool {
//        guard let login = LoginInput.text,
//              let password = PasswordInput.text else {return false}
//        var returnBool: Bool = false
//        var filter = RegistrationRepository.dataUsers.filter({$0.login == login && $0.password == password})
//        if filter.count > 0 {
//        let newfilters = filter[0]
//        if login == newfilters.login && password == newfilters.password {
//            print("Successed")
//            returnBool = true
//            filter.removeAll()
//          }
//
//        }
//        return returnBool
//    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
            if identifier == "GoMyApp" {
                let CheckResult =  prepareButtonPressed()
            if CheckResult == false {
                ShowLoginError()
            }

            return CheckResult
            }
        
            return true
        }
    
    func dismissEnd() {
        dismiss(animated: true, completion: nil)
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
        let alert = UIAlertController(title: "Неверные данные", message: "Уточните данные у администратора", preferredStyle: .alert)
           
           let actionalert = UIAlertAction(
            title: "Попробовать снова",
            style: .cancel,
            handler: {_ in UIView.animate(withDuration: 0.3, animations: {[weak self] in self?.visualEffectView?.alpha = 0})} )
            alert.addAction(actionalert)
            blurMotion()
           present(alert, animated: true, completion: nil)
    }
    
    func prepareButtonPressed() -> Bool {
        urlParc()
        if statusCode == 200 {
           boolSegue = true
        }
        return boolSegue
    }
    
    @IBAction func buttonNext(_ sender: Any) {
    }
    
    func mainGradient() {
    let mainGradnt = CAGradientLayer()
        mainGradnt.colors = [UIColor.clear.cgColor, UIColor.init(displayP3Red: 5/255, green: 24/255, blue: 161/255, alpha: 1.0).cgColor]
        mainGradnt.locations = [ 0 as NSNumber, 0.6 as NSNumber]
        mainGradnt.startPoint = CGPoint.init(x: 0, y: 0)
        mainGradnt.endPoint = CGPoint(x: 0.0, y: 1.0)
        gradientView.layer.insertSublayer(mainGradnt, at: 0)
        mainGradnt.frame = gradientView.bounds
    }
    
    func urlParc() {
            
        
            let textLog = textLogin.text
                
            let json: [String: Any] = ["username": textLog! ]

        let jsonData = try? JSONSerialization.data(withJSONObject: json)
    
        // create post request
        let url = URL(string: "http://192.168.56.65:8000/api/user/")!
        var request = URLRequest(url: url)
        var _: URLResponse?
        request.httpMethod = "POST"
    
        // insert json data to the request
        request.httpBody = jsonData
        
        let sem = DispatchSemaphore(value: 0)

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "No data")
                return
            }
            if let httpResponse = response as? HTTPURLResponse {
                            self.statusCode = httpResponse.statusCode
                            print("\(httpResponse.statusCode)")
            }
            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
            if let responseJSON = responseJSON as? [String: Any] {
                print("\(responseJSON)")
                MainView.firstName = responseJSON["first_name"] as! String
                MainView.lastName = responseJSON["last_name"] as! String
                MainView.aboutText = responseJSON["about_text"] as! String
                MainView.role = responseJSON["role"] as! String
                sem.signal()
            }
        }
            task.resume()
            if statusCode == 404 {
            sem.wait()
            
            }

        }
    
    @objc func hideKeyboard() {
        self.view.endEditing(true)
    }
    
    @IBAction func myUnwindActionSecond(unwindSegue: UIStoryboardSegue){
        textLogin.text = nil
        boolSegue = false
    
    }
    
}
