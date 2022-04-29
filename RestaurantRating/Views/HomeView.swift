//
//  HomeView.swift
//  RestaurantRating
//
//  Created by Ahmet Kaan Kara on 18.03.2022.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var authManager:AuthManager
    @ObservedObject var databaseManager = DatabaseManager()
    @State private var isAdding:Bool = false
    
    init(){
        databaseManager.getAllRestaurants()
        databaseManager.findBestRestaurant()
    }
    
    var body: some View {
        
        ZStack(alignment: .topTrailing){
            Background()

            VStack() {
                Spacer()
                ScrollView(.horizontal,showsIndicators: false) {
                    if let posts = databaseManager.restaurantRatingList {
                        HStack(spacing:14){
                            ForEach(0..<posts.count){i in
                                
                                
                                ZStack {
                                    Color.mint
                                    
                                    
                                    VStack {
                                        Text("Restoran Adı: "+posts[i].title)
                                            .foregroundColor(Color.white)
                                            .font(.system(size: 25).bold())
                                            .padding(.vertical)
                                        Spacer()
                                        Divider()
                                        Text(String (format: "Fiyat Performans Puanı: %.2f",(posts[i].pricePerformanceRating ?? 1)))
                                            .foregroundColor(Color.white)
                                            .padding()
                                    }
                                }.frame(width: 300, height: 200).cornerRadius(10).padding(.top,90)
                            }
                            
                        }
                        
                    }
                    Spacer()
                    
                }.frame(height: 150)
                Spacer()
                Text("En Yüksek Puanlı Restoran")
                    .foregroundColor(Color.white)
                    .font(.system(size: 25).bold())
                    .padding(.top)
                Image(systemName: "crown.fill")
                    .resizable()
                    .frame(width: 40, height: 30)
                    .scaledToFit()
                    .foregroundColor(Color.yellow)
                
                ZStack {
                    Color.indigo
                    VStack{
                        Text("Restoran Adı: "+databaseManager.maxpriceRatingRestaurant.title)
                            .foregroundColor(Color.white)
                            .font(.system(size: 25).bold())
                            .padding()
                        Spacer()
                        Divider()
                        Text(String (format: "Fiyat Performans Puanı: %.2f",(databaseManager.maxpriceRatingRestaurant.pricePerformanceRating ?? 1)))
                            .foregroundColor(Color.white)
                            .padding()
                        
                        
                    }
                }.frame(width: 300, height: 200).cornerRadius(10)
                Spacer()
                
            }
            
            .navigationTitle("")
            .navigationBarHidden(true)
            
            Button() {
                isAdding = true
            } label: {
                AddButtonView()
            }
            NavigationLink(destination: AddRestaurantRatingView(),isActive: self.$isAdding) {
                Text("")
            }

        
        }
        
    }
    
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

