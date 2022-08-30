//
//  DropDownMenuTableViewController.swift
//  LetsBee
//
//  Created by WonJun Choi on 2020/04/20.
//  Copyright © 2020 WonJun Choi. All rights reserved.
//

import UIKit

class DropDownMenuTableViewController<Element>: UITableViewController {
    
    typealias SelectionHandler = (Element) -> Void
    typealias LabelProvider = String
    
    private let values : [Element]

    private let onSelect : SelectionHandler?
    
    init(_ values : [Element], onSelect : SelectionHandler? = nil) {
        self.values = values
        self.onSelect = onSelect

        super.init(style: .plain)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return values.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        cell.textLabel?.text = values[indexPath.row] as? String
        cell.textLabel?.font = UIFont(name: "GodoM", size: 14)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.dismiss(animated: false)
        onSelect?(values[indexPath.row])
        
    }


}
