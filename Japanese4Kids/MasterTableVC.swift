//
//  MasterTableVC.swift
//  Japanese4Kids
//
//  Created by Le Ha Thanh on 7/26/16.
//  Copyright © 2016 le ha thanh. All rights reserved.
//

import UIKit

class MasterTableVC: UITableViewController {
    
    var dictList = ["果物(くだもの）" : "fruits.png", "動物（どうぶつ）" : "animals.png"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return dictList.count
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 130
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        
        var arrayKey = Array(dictList.keys)
        
        cell.textLabel?.text = arrayKey[indexPath.row]
        cell.imageView?.image = UIImage(named: dictList["\(arrayKey[indexPath.row])"]!)
        return cell
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "ShowDetail") {
            let detailVC = segue.destinationViewController as! DetailVC
            
            let selectedRowIndex : NSIndexPath = self.tableView.indexPathForSelectedRow!
            
            let selectedCell : UITableViewCell = self.tableView.cellForRowAtIndexPath(selectedRowIndex)!
            detailVC.stringTitle = selectedCell.textLabel?.text
        }
    }
    
    
}
