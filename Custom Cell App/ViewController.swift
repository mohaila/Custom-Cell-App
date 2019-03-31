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
        cell.nameLabel.text = Model.getName(at: indexPath.row)
        cell.locationLabel.text = Model.getLocation(at: indexPath.row)
        cell.typeLabel.text = Model.getType(at: indexPath.row)
        cell.thumbnailImageView.image = UIImage(named: Model.getImage(at: indexPath.row))
        cell.accessoryType = Model.getCheckIn(at: indexPath.row) ? .checkmark : .none
        
        return cell
    }
       
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let shareHandler = {(action: UITableViewRowAction, indexPath: IndexPath) -> Void in
            let defaultText = "Just checking in at \(Model.getName(at: indexPath.row))"
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
                let controller = segue.destination as! DetailViewController
                controller.restaurantImage = Model.getImage(at: indexPath.row)
                controller.restaurantName = Model.getName(at: indexPath.row)
                controller.restaurantType = Model.getType(at: indexPath.row)
                controller.restaurantLocation = Model.getLocation(at: indexPath.row)
            }
        }
    }
}

