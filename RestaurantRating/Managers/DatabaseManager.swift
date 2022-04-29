//
//  DatabaseManager.swift
//  RestaurantRating
//
//  Created by Ahmet Kaan Kara on 17.03.2022.
//

import Foundation
import Firebase
import SwiftUI

class DatabaseManager:ObservableObject{
    
    @Published var restaurantRatingList:[RestaurantPost]?
    @Published var maxpriceRatingRestaurant = RestaurantPost(id: "", title: "", eatenFood: "", placeRating: 0, tasteRating: 0, fullnessRating: 0, priceRating: 0, pricePerformanceRating: 0)


    
    
    private var db = Firestore.firestore()
    
    
    func addData(title:String, eatenFood:String, placeRating:Int, tasteRating:Int,fullnessRating:Int,priceRating:Int){
        
        let pricePerformanceRating:Float? = (Float(placeRating) + Float(tasteRating) + Float(fullnessRating) + Float(priceRating)) / 4
        
        db.collection("RestaurantPost").addDocument(data: ["title":title,"eatenFood":eatenFood,"placeRating":placeRating,"tasteRating":tasteRating, "fullnessRating":fullnessRating,"priceRating":priceRating,"pricePerformanceRating":pricePerformanceRating]){error in
            
            
            if error == nil{
                self.getAllRestaurants()
            }
            
            else{
                print("Eroor")
            }

        }
        
    }
    
    
    
    func getAllRestaurants(){
         db.collection("RestaurantPost").getDocuments { snapshot, error in
            guard snapshot != nil , error == nil else{
                return
            }
            DispatchQueue.main.async {
                self.restaurantRatingList = snapshot!.documents.map{ d in
                    return RestaurantPost(
                id: d.documentID as? String ?? "",
                title: d["title"] as? String ??   "",
                eatenFood: d["eatenFood"] as? String ?? "",
//              restaurantImageUrl:"asddssa",
                placeRating: d["placeRating"] as? Int ?? 0,
                tasteRating: d["tasteRating"] as? Int ?? 0,
                fullnessRating: d["fullnessRating"] as? Int ?? 0,
                priceRating:d["priceRating"] as? Int ?? 0,
                pricePerformanceRating: d["pricePerformanceRating"] as? Float ?? 0.0)
                 
                }
                

                

            }
        }
    }
    
    func findBestRestaurant(){
        db.collection("RestaurantPost").getDocuments{ snapshot,error in
            guard snapshot != nil,error == nil else{
                return
            }
            
            DispatchQueue.main.async {
                snapshot!.documents.map{d in
                    if self.maxpriceRatingRestaurant.pricePerformanceRating as? Float ?? 0 <= d["pricePerformanceRating"] as? Float ?? 0.0{
                        self.maxpriceRatingRestaurant = RestaurantPost(
                    id: d.documentID as? String ?? "",
                    title: d["title"] as? String ??   "",
                    eatenFood: d["eatenFood"] as? String ?? "",
    //              restaurantImageUrl:"asddssa",
                    placeRating: d["placeRating"] as? Int ?? 0,
                    tasteRating: d["tasteRating"] as? Int ?? 0,
                    fullnessRating: d["fullnessRating"] as? Int ?? 0,
                    priceRating:d["priceRating"] as? Int ?? 0,
                    pricePerformanceRating: d["pricePerformanceRating"] as? Float ?? 0.0)
                        
                        
                    }
                }
            }
            
        }
    }
    
    
    
}
