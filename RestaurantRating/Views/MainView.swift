//
//  MainView.swift
//  RestaurantRating
//
//  Created by Ahmet Kaan Kara on 17.03.2022.
//

import SwiftUI

struct MainView: View {
    var body: some View {

        TabView {

            HomeView()
            .tabItem {
                Text("Anasayfa")
                    .foregroundColor(Color.white)
                Image(systemName: "house")
                    .accentColor(Color.red)
                
             
            }
            
            ProfileView()
                .tabItem {
                    Text("Settings")
                    Image(systemName: "gear")
                }
        }
        .navigationTitle("")
        .navigationBarHidden(true)
        
        
    }
    
    
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
