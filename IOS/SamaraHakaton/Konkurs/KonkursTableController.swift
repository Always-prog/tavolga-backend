//
//  KonkursTableController.swift
//  SamaraHakaton
//
//  Created by Степан Харитонов on 04.12.2021.
//

import UIKit

class KonkursTableController: UITableViewController {

    var konkurs = RepoMain()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        urlParc()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
       
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      
        return konkurs.mainBlock.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "konkursID", for: indexPath) as? KonkursCell else {
            return UITableViewCell()
        }
        let cellRowAtIndex = konkurs.mainBlock[indexPath.row]
        cell.nameKonkurs.text = cellRowAtIndex.nameKonkurs

        return cell
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let nameKK = segue.destination as? NominationsController else {
            return
        }
        guard let seguePath = segue.source as? KonkursTableController else {
            return
        }
        if let newIndex = seguePath.tableView.indexPathForSelectedRow {
            let numberKonkurs = seguePath.konkurs.mainBlock[newIndex.row]
            nameKK.segueKonkurs = numberKonkurs
        }
    }
    
    func urlParc() {
            
        let json: [String: String] = ["username": "<имя ассесора>"]

        let jsonData = try? JSONSerialization.data(withJSONObject: json)
    
        // create post request
        let url = URL(string: "http://192.168.56.65:8000/api/user/participant/")!
        var request = URLRequest(url: url)
        //var _: URLResponse?
        request.httpMethod = "POST"
    
        // insert json data to the request
        request.httpBody = jsonData
        
        //let sem = DispatchSemaphore(value: 0)

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "No data")
                return
            }
//            if let httpResponse = response as? HTTPURLResponse {
//                            self.statusCode = httpResponse.statusCode
//                            print("\(httpResponse.statusCode)")
//            }
            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
            if let responseJSON = responseJSON as? [String: String] {
                print("\(responseJSON)")
                
                //sem.signal()
            }
        }
            task.resume()
            //sem.wait()
        }
    

}
