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
        return Model.count()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let ident = "CustomCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: ident, for: indexPath) as! CustomCellView
        
        // Configure Cell
        let restaurant = Model.getRestaurant(at: indexPath.row)
        cell.nameLabel.text = restaurant.name
        cell.locationLabel.text = restaurant.location
        cell.typeLabel.text = restaurant.type
        cell.thumbnailImageView.image = UIImage(named: restaurant.image)
        cell.accessoryType = restaurant.isVisited ? .checkmark : .none
        
        return cell
    }
       
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let shareHandler = {(action: UITableViewRowAction, indexPath: IndexPath) -> Void in
            let restaurant = Model.getRestaurant(at: indexPath.row)
            let defaultText = "Just checking in at \(restaurant.name)"
            let ac = UIActivityViewController(activityItems: [defaultText], applicationActivities: nil)
            self.present(ac, animated: true, completion: nil)
        }
        let shareAction = UITableViewRowAction(style: .default, title: "Share", handler: shareHandler)
        shareAction.backgroundColor = UIColor(red: 0.2, green: 0.8, blue: 0.45, alpha: 1.0)
        
        let deleteHandler = {(action: UITableViewRowAction, indexPath: IndexPath) -> Void in
            Model.remove(index: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
        let deleteAction = UITableViewRowAction(style: .default, title: "Delete", handler: deleteHandler)
        
        return [shareAction, deleteAction]
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showRestaurantDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let restaurant = Model.getRestaurant(at: indexPath.row)
                let controller = segue.destination as! DetailViewController
                controller.restaurant = restaurant
            }
        }
    }
}

