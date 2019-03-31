//
// ViewController.swift
// Custom Cell App
//
// Created by mohaila on 2019-03-30.
// Copyright © 2019 mohaila. All rights reserved. 
//
	

import UIKit

class ViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Model.restaurantNames.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let ident = "CustomCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: ident, for: indexPath) as! CustomCellView
        
        // Configure Cell
        cell.nameLabel.text = Model.restaurantNames [indexPath.row]
        cell.locationLabel.text = Model.restaurantLocations  [indexPath.row]
        cell.typeLabel.text = Model.restaurantTypes  [indexPath.row]
        cell.thumbnailImageView.image = UIImage(named: Model.restaurantImages  [indexPath.row])
        
        return cell
    }

}

