//
//  APIManager.swift
//  Demo App
//
//  Created by Mohammad Farhan on 21/12/21.
//

import Foundation

protocol APIManagerDelegate {
    func didUpdateUI(jsonData: [DevListModel])
}

struct APIManager {
    let url = Constants.StringValues.countryAPIURL
    var delegate: APIManagerDelegate?
    
    // API request function
    func performRequest() {
        if let url = URL(string: url) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error != nil {
                    print(error!)
                    return
                }
                if let safeData = data {
                    if let decodedJsonData = parseJSON(data: safeData){
                        self.delegate?.didUpdateUI(jsonData: decodedJsonData)
                    }
                }
            }
            task.resume()
        }
        
    }
    
    // Parse JSON data function
    func parseJSON(data: Data) -> [DevListModel]? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode([DevListModel].self, from: data)
            return decodedData
        } catch {
            print(error)
            return nil
        }
    }
    
}
