//
//  AuthManager.swift
//  RestaurantRating
//
//  Created by Ahmet Kaan Kara on 17.03.2022.
//

import Firebase
import FirebaseAuth
import SwiftUI
import CoreMedia

final class AuthManager:ObservableObject{
    
    let auth = Auth.auth()
    
    @Published var signedIn = false
    
    var isSignedIn: Bool{
        return auth.currentUser != nil
    }
    
    func signIn(email:String,password:String){
        auth.signIn(withEmail: email, password: password) {[weak self] result, error in
            guard result != nil,error == nil else{
                return
            }
            self?.signedIn = true
            print("signedin")
        }
        
    }
    
    
    func signUp(email:String,password:String){
        auth.createUser(withEmail: email, password: password) {[weak self] result, error in
            guard result != nil,error == nil else{
                return
            }
            
            DispatchQueue.main.async {
                self?.signedIn = true
                print("signedup")

            }
            
        }
    }
    
    func signOut(){
        try? auth.signOut()
        self.signedIn = false
        print("signedout")

    }
    

    
    
}
