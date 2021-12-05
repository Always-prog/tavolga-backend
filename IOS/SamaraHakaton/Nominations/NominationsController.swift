//
//  NominationsController.swift
//  SamaraHakaton
//
//  Created by Степан Харитонов on 04.12.2021.
//

import UIKit

class NominationsController: UITableViewController {

    var segueKonkurs: MainArray?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
      
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return (segueKonkurs?.nameNominations.count)!
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "nominationsID", for: indexPath) as? NominationsCell else {
            return UITableViewCell()
        }

        let nomRow = segueKonkurs
        cell.numberStud.text = String(describing: (nomRow?.nameStudents.count)!)
        cell.avatarNomView.image = UIImage(named: "PhotoNil")
        cell.backImageView.layer.cornerRadius = cell.backImageView.frame.height/2
        cell.avatarNomView.layer.cornerRadius = cell.backImageView.layer.cornerRadius
        cell.nameNom.text = nomRow!.nameNominations[indexPath.row]
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let nameKK = segue.destination as? StudentsController else {
            return
        }
        guard let seguePath = segue.source as? NominationsController else {
            return
        }
        if let newIndex = seguePath.tableView.indexPathForSelectedRow {
            nameKK.Nominations = segueKonkurs
            nameKK.segueNameNominate = segueKonkurs?.nameNominations[newIndex.row]
        }
        
    }


}
