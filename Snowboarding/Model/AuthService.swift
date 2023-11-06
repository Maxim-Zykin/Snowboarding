//
//  AuthService.swift
//  Snowboarding
//
//  Created by Максим Зыкин on 26.02.2023.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore


class AuthService {
     
    public static let shared = AuthService()
    
    private init(){}
    
    /// A method to register the user
    /// - Parameters:
    ///     - userRequest: The users information (email, password, username)
    ///     - completion: A completion with two values..
    ///     - Bool: wasRegistered - Determines if the user was registered and saved in the database correctly
    ///     - Error?: An optional error if firebase provides once
    public func registerUser(with userRecuest: RegiserUserRequest, completion: @escaping (Bool, Error?)->Void) {
        
        let userName = userRecuest.usarname
        let email = userRecuest.email
        let password = userRecuest.password
        
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                completion(false, error)
                return
            }
            
            guard let resultUser = result?.user else {
                completion(false, nil)
                return
            } 
            
            let bd = Firestore.firestore()
            bd.collection("users")
                .document(resultUser.uid)
                .setData([
                    "usarname": userName,
                    "email": email,
                ]) { error in
                    if let error = error {
                        completion(false, error)
                        return
                    }
                    completion(true, nil)
                }
        }
    }
    
    public func singIn(with userRequest: LoginUserRequest, completion: @escaping(Error?)-> Void) {
        Auth.auth().signIn(withEmail: userRequest.email, password: userRequest.password) { result, error in
            if let error = error {
                completion(error)
                return
            } else {
                completion(nil)
            }
        }
    }
    
    public func signOut(completion: @escaping (Error?)->Void) {
        do {
            try Auth.auth().signOut()
            completion(nil)
        } catch let error {
            completion(error)
        }
    }
    
    public func delete(completion: @escaping (Error?)->Void){
        let user = Auth.auth().currentUser

        user?.delete { error in
          if let error = error {
              print("Ошибка \(error.localizedDescription)")
          } else {
            print("Пользователь удален")
          }
        }
    }
    
    public func forgotPassword(with email: String, complition: @escaping (Error?)->Void) {
        Auth.auth().sendPasswordReset(withEmail: email) { error in
            complition(error)
        }
    }
    
    public func fetchUser(completion: @escaping (User?, Error?)->Void) {
        guard let userUID = Auth.auth().currentUser?.uid else { return }
        
        let db = Firestore.firestore()
            db.collection("users")
            .document(userUID)
            .getDocument { snapshot, error in
                if let error = error {
                    completion(nil, error)
                    return
                }
                
                if let snapshot = snapshot,
                   let snapshotData = snapshot.data(),
                   let usarname = snapshotData["usarname"] as? String,
                   let email = snapshotData["email"] as? String {
                    let user = User(usarname: usarname, email: email, userUID: userUID)
                    completion(user, nil)
                    print("\(usarname), \(userUID)")
                }
            }
    }
}
