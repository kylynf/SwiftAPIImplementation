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
        self.tableView.rowHeight = 180
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return store.factList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath) as! ItemCell
        
        let item = store.factList[indexPath.row]
        
        cell.numberLabel.text = "\(item.number)"
        cell.factLabel.text = "\(item.text)"
        
        
        return cell
    }

}
