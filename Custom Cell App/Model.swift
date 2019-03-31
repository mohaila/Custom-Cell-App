//
// Model.swift
// Custom Cell App
//
// Created by mohaila on 2019-03-30.
// Copyright © 2019 mohaila. All rights reserved. 
//
	

import UIKit

class Model {
    static private var restaurants = [Restaurant(name: "Cafe Deadend", type: "Coffee & Tea Shop", location: "Hong Kong", image: "cafedeadend.jpg"),
                                      Restaurant(name: "Homei", type: "Cafe", location: "Hong Kong", image: "homei.jpg"),
                                      Restaurant(name: "Teakha", type: "Tea House", location: "Hong Kong", image: "teakha.jpg"),
                                      Restaurant(name: "Cafe Loisl", type: "Austrian / Causual Drink", location: "Hong Kong", image: "cafeloisl.jpg"),
                                      Restaurant(name: "Petite Oyster", type: "French", location: "Hong Kong", image: "petiteoyster.jpg"),
                                      Restaurant(name: "For Kee Restaurant", type: "Bakery", location: "Hong Kong", image: "forkeerestaurant.jpg"),
                                      Restaurant(name: "Po's Atelier", type: "Bakery", location: "Hong Kong", image: "posatelier.jpg"),
                                      Restaurant(name: "Bourke Street Bakery", type: "Chocolate", location: "Sydney", image: "bourkestreetbakery.jpg"),
                                      Restaurant(name: "Haigh's Chocolate", type: "Cafe", location: "Sydney", image: "haighschocolate.jpg"),
                                      Restaurant(name: "Palomino Espresso", type: "American / Seafood", location: "Sydney", image: "palominoespresso.jpg"),
                                      Restaurant(name: "Upstate", type: "American", location: "New York", image: "upstate.jpg"),
                                      Restaurant(name: "Traif", type: "American", location: "New York", image: "traif.jpg"),
                                      Restaurant(name: "Graham Avenue Meats", type: "Breakfast & Brunch", location: "New York", image: "grahamavenuemeats.jpg"),
                                      Restaurant(name: "Waffle & Wolf", type: "Coffee & Tea", location: "New York", image: "wafflewolf.jpg"),
                                      Restaurant(name: "Five Leaves", type: "Coffee & Tea", location: "New York", image: "fiveleaves.jpg"),
                                      Restaurant(name: "Cafe Lore", type: "Latin American", location: "New York", image: "cafelore.jpg"),
                                      Restaurant(name: "Confessional", type: "Spanish", location: "New York", image: "confessional.jpg"),
                                      Restaurant(name: "Barrafina", type: "Spanish", location: "London", image: "barrafina.jpg"),
                                      Restaurant(name: "Donostia", type: "Spanish", location: "London", image: "donostia.jpg"),
                                      Restaurant(name: "Royal Oak", type: "British", location: "London", image: "royaloak.jpg"),
                                      Restaurant(name: "CASK Pub and Kitchen", type: "Thai", location: "London", image: "caskpubkitchen.jpg"),]

   
    static func count() -> Int {
        return restaurants.count
    }
    
    static func remove(index: Int) {
        restaurants.remove(at: index)
    }
    
    static func getRestaurant(at: Int) -> Restaurant {
        return restaurants [at]
    }
}
