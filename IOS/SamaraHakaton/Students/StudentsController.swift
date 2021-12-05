//
//  StudentsController.swift
//  SamaraHakaton
//
//  Created by Степан Харитонов on 04.12.2021.
//

import UIKit

class StudentsController: UITableViewController {

    
    var Nominations: MainArray?
    var segueNameNominate: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (Nominations?.nameStudents.count)!
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "studentsID", for: indexPath) as? StudentsCell else {
            return UITableViewCell()
        }
        let nomi = Nominations
        cell.nameStud.text = nomi?.nameStudents[indexPath.row]
        cell.avatarStud.image = UIImage(named: "Александр")
        cell.backStudView.layer.cornerRadius = cell.backStudView.frame.height/2
        cell.avatarStud.layer.cornerRadius = cell.backStudView.layer.cornerRadius
        

        return cell
    }
    

    @IBAction func kriteriiStud(_ sender: Any) {
    }
    
}
