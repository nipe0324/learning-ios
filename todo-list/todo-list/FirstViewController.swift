//
//  FirstViewController.swift
//  todo-list
//
//  Created by yanagi on 2019/08/07.
//  Copyright © 2019 nipe0324. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var table: UITableView!

    var items: [String] = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "Cell")
        var cellLabel = ""
        
        
        if let tempLabel = items[indexPath.row] {
            cellLabel = tempLabel
        }
        
        cell.textLabel?.text = cellLabel
        return cell
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidAppear(_ animated: Bool) {
        let itemsObject = UserDefaults.standard.object(forKey: "items")
        
        if let tempItems = itemsObject as? [String] {
            items = tempItems
        }
        
        print(items)
        
        table.reloadData()
    }


}

