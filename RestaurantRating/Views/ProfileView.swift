//
//  ProfileView.swift
//  RestaurantRating
//
//  Created by Ahmet Kaan Kara on 18.03.2022.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var authManager:AuthManager

    var body: some View {
        ZStack{
            Background()
            VStack{
                Text("Profile")
                
                Button {
                    authManager.signOut()
                
                } label: {
                    Text("Çıkış Yap")
                }

            }
            .navigationTitle("")
            .navigationBarHidden(true)
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
