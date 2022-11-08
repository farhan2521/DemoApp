//
//  UserDetailsRepo.swift
//  Demo App
//
//  Created by Mohammad Farhan on 14/12/21.
//

import Foundation

class UserDetailsRepo{
    let defaults = UserDefaults.standard
    
    static let singletonUserDetailsRepo = UserDetailsRepo()
    
    // Search repository method
    func searchRepo(name: String) -> Bool {
        for userRepo in defaults.array(forKey: Constants.Ids.userData)  as! [[String: String]]{
            if name == userRepo[Constants.Ids.name]{
                return true
            }
        }
        return false
    }
    
    // Check password for given username method
    func checkPassword(username: String) -> String {
        for userRepo in defaults.array(forKey: Constants.Ids.userData)  as! [[String: String]]{
            if username == userRepo[Constants.Ids.name]{
                return userRepo[Constants.Ids.password]!
            }
        }
        return ""
    }
    
    // Change password for particular username method
    func resetPassword(name: String, password: String) {
        var fullUserData = defaults.array(forKey: Constants.Ids.userData)  as! [[String: String]]
        for i in 0...fullUserData.count-1 {
            if name == fullUserData[i][Constants.Ids.name] {
                fullUserData[i][Constants.Ids.password] = password
            }
        }
        self.defaults.set(fullUserData, forKey: Constants.Ids.userData)
    }
}
