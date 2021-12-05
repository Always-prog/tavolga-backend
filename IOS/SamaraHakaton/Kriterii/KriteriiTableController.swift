//
//  KriteriiTableController.swift
//  SamaraHakaton
//
//  Created by Степан Харитонов on 04.12.2021.
//

import UIKit

class KriteriiTableController: UITableViewController {
        
    
  
    @IBOutlet weak var kriteriiTable: UITableView!
    @IBOutlet weak var nameStudHeader: UILabel!
    @IBOutlet weak var infoStudHeader: UILabel!
    @IBOutlet weak var backViewHeader: UIView!
    @IBOutlet weak var photoStudHeader: UIImageView!
    
    var kriterius = RepoKrit()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCustomCell()
        nameStudHeader.text = MainView.firstName + " " + MainView.lastName
        infoStudHeader.text = MainView.aboutText
        photoStudHeader.image = UIImage(named: "Александр")
        backViewHeader.layer.cornerRadius = backViewHeader.frame.height/2
        photoStudHeader.layer.cornerRadius = backViewHeader.layer.cornerRadius
        backViewHeader.layer.shadowColor = UIColor.white.cgColor
        backViewHeader.layer.shadowOffset = CGSize.zero
        backViewHeader.layer.shadowRadius = 8
        backViewHeader.layer.shadowOpacity = 0.8
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return kriterius.kritBlock.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = kriteriiTable.dequeueReusableCell(withIdentifier: "customID", for: indexPath) as? CustomTableKriteriiCell else {
            return UITableViewCell()
        }
        
        let kritCell = kriterius.kritBlock[indexPath.row]
        
        
        cell.opisanie.text = kritCell.nameKrit
        cell.kriterii.text = kritCell.uslKrit
        cell.character.text = kritCell.infoUser
        cell.numberRow.text = String(describing: (indexPath.row+1) )
        cell.mainView.layer.cornerRadius = 15
        cell.mainView.layer.shadowColor = UIColor.black.cgColor
        cell.mainView.layer.shadowRadius = 3
        cell.mainView.layer.shadowOffset = CGSize.zero
        cell.mainView.layer.shadowOpacity = 1
        cell.buttonEnd.addTarget(self, action: #selector(scoresFinal(sender:)), for: .touchUpInside)
        
    
     
    
        return cell
    }
    
         // MARK: Privat func
     private func registerCustomCell() {
             kriteriiTable.delegate = self
             kriteriiTable.dataSource = self
             kriteriiTable.register(UINib(nibName: "KriteriiTableView", bundle: nil), forCellReuseIdentifier: "customID")
         }
    
    @objc func scoresFinal(sender: UIButton) {
   //     if 
    }
    
}
