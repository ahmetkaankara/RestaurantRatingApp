//
//  RestaurantRatingApp.swift
//  RestaurantRating
//
//  Created by Ahmet Kaan Kara on 17.03.2022.
//

import SwiftUI
import Firebase

@main
struct RestaurantRatingApp: App {
    
    init(){
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            let authManager = AuthManager()
            let databaseManager = DatabaseManager()
            ContentView()
                .environmentObject(authManager)
                .environmentObject(databaseManager)
        }
    }
}
