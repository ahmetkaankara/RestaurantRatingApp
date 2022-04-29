//
//  File.swift
//  RestaurantRating
//
//  Created by Ahmet Kaan Kara on 18.03.2022.
//

import Foundation
import SwiftUI

struct Background:View{
    var body: some View{
        LinearGradient(colors: [Color(""),Color.purple], startPoint: .bottomLeading, endPoint: .topTrailing)
            .ignoresSafeArea()
    }
    
    
}

struct AddButtonView:View{
    
    var body: some View{
        VStack {
            HStack {
                Spacer()
                Image(systemName: "plus.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 30, alignment:.topTrailing)
                    .foregroundColor(Color.white)
                    .padding()
            }
        }
        Spacer()
        
        Spacer()
        
            .navigationBarHidden(true)
    }
}
