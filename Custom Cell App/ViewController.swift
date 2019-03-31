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
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let optionMenu = UIAlertController(title: nil, message: "What do you want to do?", preferredStyle: .actionSheet)
        
        let callActionHandler = {(action:UIAlertAction)->Void in
            let alertMessage = UIAlertController(title: "Service Unavailable", message: "Sorry, the call feature is not available", preferredStyle: .alert)
            alertMessage.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alertMessage, animated: true, completion: nil)
        }
        let callAction = UIAlertAction(title: "Call (800)123-\(indexPath.row)", style: .default, handler: callActionHandler)
        optionMenu.addAction(callAction)
        
        if Model.getCheckIn(at: indexPath.row) {
            let undoCheckinHandler = {(action:UIAlertAction)->Void in
                let cell = tableView.cellForRow(at: indexPath)
                cell?.accessoryType = .none
                Model.setCheckIn(at: indexPath.row, checkin: false)
            }
            let undoCheckinAction = UIAlertAction(title: "Undo Check in", style: .default, handler: undoCheckinHandler)
            optionMenu.addAction(undoCheckinAction)
        } else {
            let checkinHandler = {(action:UIAlertAction)->Void in
                let cell = tableView.cellForRow(at: indexPath)
                cell?.accessoryType = .checkmark
                Model.setCheckIn(at: indexPath.row, checkin: true)
            }
            let checkinAction = UIAlertAction(title: "Check in", style: .default, handler: checkinHandler)
            optionMenu.addAction(checkinAction)
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        optionMenu.addAction(cancelAction)
        
        present(optionMenu, animated: true, completion: nil)
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            Model.remove(index: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}

