//
//  ListViewController.swift
//  Demo App
//
//  Created by Mohammad Farhan on 21/12/21.
//

import UIKit

class ListViewController: UIViewController, APIManagerDelegate {
    var apiManager = APIManager()
    var devList: [DevListModel] = [DevListModel]()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        apiManager.delegate = self
        apiManager.performRequest()
    }
    
    // Append data in devList from json Data
    func didUpdateUI(jsonData: [DevListModel]) {
        for items in jsonData {
            devList.append(DevListModel(postId: items.postId, id: items.id, name: items.name, email: items.email, body: items.body))
        }
        DispatchQueue.main.async {
            self.tableView.dataSource = self
        }
    }
    
}


extension ListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return devList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.Ids.reusableCell, for: indexPath)
        cell.textLabel?.text = devList[indexPath.row].name
        cell.detailTextLabel?.text = devList[indexPath.row].email
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}
