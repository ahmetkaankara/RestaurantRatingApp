//
//  AddRestaurantRatingView.swift
//  RestaurantRating
//
//  Created by Ahmet Kaan Kara on 19.03.2022.
//

import SwiftUI

struct AddRestaurantRatingView: View {
    @ObservedObject var databaseManager = DatabaseManager()
    @State var priceRating:Int = 0
    @State var fullnessRating:Int = 0
    @State var tasteRating:Int = 0
    @State var placeRating:Int = 0
    @State var title:String = ""
    @State var eatenFood:String = ""

    
    @State var isAdded:Bool = false
    
    
    var body: some View {
        ZStack {
            Background().ignoresSafeArea()

            VStack{
                VStack{
                    TextField("Restoran Adı", text: $title)
                        .frame(width: 300, height: 20)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(50)
                    
                    TextField("Favori Yemek",text: $eatenFood)
                        .frame(width: 300, height: 20)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(50)
                    
                }
                VStack(alignment:.leading){

                        HStack {
                            Text("Mekan Puanı: ")
                                .foregroundColor(Color.white)
                                .font(.headline.bold())
                            Picker("", selection: $placeRating) {
                                ForEach(0..<11){
                                    Text("\($0)").foregroundColor(Color.white)
                                }
                            }
                        }
                        
                        HStack {
                            Text("Lezzet Puanı: ")
                                .foregroundColor(Color.white)
                                .font(.headline.bold())
                            Picker("Number Of Selection", selection: $tasteRating) {
                                ForEach(0..<11){
                                    Text("\($0)")
                                }
                            }
                        }
                        
                        HStack {
                            Text("Fiyat Puanı: ")
                                .foregroundColor(Color.white)
                                .font(.headline.bold())
                            Picker("Number Of Selection", selection: $priceRating) {
                                ForEach(0..<11){
                                    Text("\($0)")
                                }
                            }
                        }
                        
                        HStack {
                            Text("Doyuruculuk Puanı: ")
                                .foregroundColor(Color.white)
                                .font(.headline.bold())
                            Picker("Number Of Selection", selection: $fullnessRating) {
                                ForEach(0..<11){
                                    Text("\($0)")
                                }
                            }
                        }

                }
                VStack{
                    Button {
                        databaseManager.addData(title:title, eatenFood: eatenFood, placeRating: placeRating, tasteRating: tasteRating, fullnessRating: fullnessRating, priceRating: priceRating)
                        isAdded = true
                        
                    } label: {
                        Text("Eklemek İçin Tıkla")
                            .frame(width: 200, height: 45)
                            .font(.system(size: 20).bold())
                            .background(Color.white)
                            .foregroundColor(Color.purple)
                            .cornerRadius(10)
                            .padding(.top)
                    }
                }

            }
            .navigationTitle("Restoran Değerlendir")
        }

        NavigationLink(destination:HomeView(),isActive: $isAdded){
            Text("")
                
        }

    }

}

struct AddRestaurantRatingView_Previews: PreviewProvider {
    static var previews: some View {
        AddRestaurantRatingView()
    }
}
