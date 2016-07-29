//
//  DetailVC.swift
//  Japanese4Kids
//
//  Created by Le Ha Thanh on 7/27/16.
//  Copyright © 2016 le ha thanh. All rights reserved.
//

import UIKit

class DetailVC: UIViewController{
    
    var stringTitle: String!
    var dictData : NSDictionary!
    var arrayKeys : NSArray!
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = stringTitle
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        self.createDataWithName(stringTitle)
        
        // Do any additional setup after loading the view.
    }
    
    func createDataWithName(title: String) {
        var path : String = ""
        if title == "動物（どうぶつ）" {
            path = NSBundle.mainBundle().pathForResource("AnimalsList", ofType: "plist")!
        }
        
        if title == "果物(くだもの）" {
            path = NSBundle.mainBundle().pathForResource("FruitsList", ofType: "plist")!
        }
        
        dictData = NSDictionary(contentsOfFile: path)!
        arrayKeys = dictData.allKeys
//        arrayKeys = arrayKeys.sortedArrayUsingSelector("compare:")
        
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayKeys.count
    }
    
    // Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
    // Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        
        let key : String = arrayKeys[indexPath.row] as! String
        cell.textLabel?.text = key
        cell.imageView?.image = UIImage(named: "\(dictData[key]!)")
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 75
    }
    
    //
    
    public func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){

        let v2 = self.storyboard?.instantiateViewControllerWithIdentifier("Detail") as! DetailDetailView
        self.navigationController?.pushViewController(v2, animated: true)
        let key : String = arrayKeys[indexPath.row] as! String
        v2.img = UIImage(named: "\(dictData[key]!)")
        v2.text = key
    }
    
}
