//
// Model.swift
// Custom Cell App
//
// Created by mohaila on 2019-03-30.
// Copyright © 2019 mohaila. All rights reserved. 
//
	

import UIKit

class Model {
    static private var restaurantNames = ["Cafe Deadend", "Homei", "Teakha", "Cafe Loisl", "Petite Oyster", "For Kee Restaurant", "Po's Atelier", "Bourke Street Bakery", "Haigh's Chocolate", "Palomino Espresso", "Upstate", "Traif", "Graham Avenue Meats", "Waffle & Wolf", "Five Leaves", "Cafe Lore", "Confessional", "Barrafina", "Donostia", "Royal Oak", "CASK Pub and Kitchen"]
    
    static private var restaurantImages = ["cafedeadend.jpg", "homei.jpg", "teakha.jpg", "cafeloisl.jpg", "petiteoyster.jpg", "forkeerestaurant.jpg", "posatelier.jpg", "bourkestreetbakery.jpg", "haighschocolate.jpg", "palominoespresso.jpg", "upstate.jpg", "traif.jpg", "grahamavenuemeats.jpg", "wafflewolf.jpg", "fiveleaves.jpg", "cafelore.jpg", "confessional.jpg", "barrafina.jpg", "donostia.jpg", "royaloak.jpg", "caskpubkitchen.jpg"]
    
    static private var restaurantLocations = ["Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Sydney", "Sydney", "Sydney", "New York", "New York", "New York", "New York", "New York", "New York", "New York", "London", "London", "London", "London"]
    
    static private var restaurantTypes = ["Coffee & Tea Shop", "Cafe", "Tea House", "Austrian / Causual Drink", "French", "Bakery", "Bakery", "Chocolate", "Cafe", "American / Seafood", "American", "American", "Breakfast & Brunch", "Coffee & Tea", "Coffee & Tea", "Latin American", "Spanish", "Spanish", "Spanish", "British", "Thai"]
    
    static private var restaurantCheckins = Array(repeating: false, count: 21)
    
    static func getName(at: Int) -> String {
        return restaurantNames [at]
    }
    
    static func getImage(at: Int) -> String {
        return restaurantImages [at]
    }
    
    static func getLocation(at: Int) -> String {
        return restaurantLocations [at]
    }
    
    static func getType(at: Int) -> String {
        return restaurantTypes [at]
    }
    
    static func getCheckIn(at: Int) -> Bool{
        return restaurantCheckins [at]
    }
    
    static func setCheckIn(at: Int, checkin: Bool) {
        restaurantCheckins [at] = checkin
    }
    
    static func count() -> Int {
        return restaurantNames.count
    }
    
    static func remove(index: Int) {
        restaurantNames.remove(at: index)
        restaurantImages.remove(at: index)
        restaurantLocations.remove(at: index)
        restaurantTypes.remove(at: index)
    }
}
