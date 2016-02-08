//
//  TableViewController.swift
//  EJKeyBoard
//
//  Created by Elton Melo on 08/02/16.
//  Copyright © 2016 MBmobil. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    override func viewDidLoad() {
        title = "KeyBoard"
        super.viewDidLoad()
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 11
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("TableViewCell", forIndexPath: indexPath) as! TableViewCell
        
        cell.labelTitle.text = nameTitleCell(indexPath)
        
        return cell
    }
    
    func nameTitleCell(indexPath: NSIndexPath) -> String {
        var name = ""
        
        switch (indexPath.row){
        case 0:
            name = "First name"
            break
        case 1:
            name = "Last name"
            break
        case 2:
            name = "Age"
            break
        case 3:
            name = "Phone"
            break
        case 4:
            name = "Teste"
            break
        case 5:
            name = "Teste"
            break
        case 6:
            name = "Teste"
            break
        case 7:
            name = "Teste"
            break
        default:
            name = "Teste"
            break
        }
        
        return name
    }
    
    
}
