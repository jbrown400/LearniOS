//
//  AuthManager.swift
//  HelloWorld
//
//  Created by Justin Brown on 8/22/20.
//  Copyright © 2020 Justin Brown. All rights reserved.
//

import Foundation
import FirebaseAuth

public class AuthManager {
    static let shared = AuthManager()
    
    public func registerNewUser(username: String, email: String, password: String, completion: @escaping (Bool) -> Void) {
        /*
         1. Check if username is available
         2. Check if emial is available
         3. Create account
         4. Insert account to DB
         */
        
        DatabaseManager.shared.canCreateNewUser(with: email, username: username) { canCreate in
            if canCreate {
                Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
                    guard error == nil, result != nil else {
                        // Firebase auth could note create account
                        completion(false)
                        return
                    }
                    
                    // Insert into DB
                    DatabaseManager.shared.insertNewUser(with: email, username: username) { inserted in
                        if inserted {
                            completion(true)
                            return
                        } else {
                            completion(false)
                            return
                        }
                    }
                }
            } else {
                // either username or email does not exist
                completion(false)
            }
        }
    }
    
    public func loginUser(username: String?, email: String?, password: String, completion: @escaping (Bool) -> Void) {
        if let email = email {
            // email log in
            Auth.auth().signIn(withEmail: email, password: password) { (authResult, error) in
                guard authResult != nil, error == nil else {
                    completion(false)
                    return
                }
                
                completion(true)
            }
        }
        else if let username = username {
            // username log in
            print(username)
        }
    }
}
