//
//  ContentView.swift
//  RestaurantRating
//
//  Created by Ahmet Kaan Kara on 17.03.2022.
//

import SwiftUI


struct ContentView: View {
    
    @EnvironmentObject var authManager: AuthManager
    
    var body: some View {
        NavigationView{
            if authManager.isSignedIn{
                MainView()
            }
            
            else{
                SignInView()
            }
            
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
