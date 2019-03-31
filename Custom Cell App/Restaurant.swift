//
// Restaurant.swift
// Custom Cell App
//
// Created by mohaila on 2019-03-31.
// Copyright © 2019 mohaila. All rights reserved. 
//
	

import UIKit

class Restaurant: NSObject {
    var name: String!
    var location: String!
    var type: String!
    var image: String!
    var isVisited: Bool!
    
    init(name: String, type: String, location: String, image: String, isVisited: Bool = false) {
        self.name = name
        self.type = type
        self.location = location
        self.image = image
        self.isVisited = isVisited
    }
}
