//
//  ItemsViewController.swift
//  randomNumber
//
//  Created by Kylyn Fernandez on 11/13/18.
//  Copyright © 2018 Kylyn Fernandez. All rights reserved.
//

import UIKit

class ItemsViewController: UITableViewController {
    
    var store: PhotoStore!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: NSIndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath) as! ItemCell
        
        let item = itemStore.allItems[indexPath.row]
        
        //configure cell with item
        cell.numberLabel.text =
        cell.factLabel.text =
        
        return cell
    }
}
