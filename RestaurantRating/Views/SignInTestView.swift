//
//  SignInTestView.swift
//  RestaurantRating
//
//  Created by Ahmet Kaan Kara on 18.03.2022.
//

import SwiftUI

struct SignInTestView: View {
    
    @State var email = ""
    @State var password = ""
    
    @EnvironmentObject var authManager:AuthManager
    
    
    
    var body: some View {
            NavigationView{
                Text("sasda")
                    .navigationTitle("Merhabalar")
            }
           LinearGradient(colors: [Color(""),Color.purple], startPoint: .bottomLeading, endPoint: .topTrailing).ignoresSafeArea(.all))
            

            

        }
    }
struct SignInTestView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SignInTestView()
                .previewDevice("iPhone 11")
            SignInTestView()
                .previewDevice("iPhone 11")
        }
    }
}
