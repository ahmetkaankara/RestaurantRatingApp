//
//  RestaurantPost.swift
//  RestaurantRating
//
//  Created by Ahmet Kaan Kara on 18.03.2022.
//

import Foundation

struct RestaurantPost:Identifiable{
    var id:String
    let title:String
    let eatenFood:String
//    let restaurantImageUrl:URL?
    let placeRating:Int
    let tasteRating:Int
    let fullnessRating:Int
    let priceRating:Int
    let pricePerformanceRating:Float?
    
    
    
}
