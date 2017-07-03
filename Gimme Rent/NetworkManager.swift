//
//  NetworkManager.swift
//  
//
//  Created by Oleksiy Lubarets on 14.06.17.
//
//

import Foundation
import Parse

class NetworkManager {

    static func login(withLogin login: String, andPassword password: String, completion: @escaping (PFUser?, Error?)->()) {
        PFUser.logInWithUsername(inBackground: login, password: password) { (user, error) in completion(user, error)}
    }    
}
