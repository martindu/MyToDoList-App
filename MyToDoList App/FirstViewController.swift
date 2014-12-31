//
//  FirstViewController.swift
//  MyToDoList App
//
//  Created by Martin Dureja on 12/30/14.
//  Copyright (c) 2014 Martin Dureja. All rights reserved.
//

import UIKit

//var item : [(title: String, detail: String)?] = []

var item:[String] = [ ]

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tasksTable:UITableView?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
    
            return item.count
    }
    
    // Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
    // Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)
    
    var arr = ["martin","dureja"]
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
    
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "cell")
        
        var ex = item[indexPath.row]
        
        println("Ex value is: \(ex)" )
        
        cell.textLabel?.text = ex
        
        return cell
    }

    override func viewWillAppear(animated: Bool) {
        
        
        if var storedToDoItems: AnyObject = NSUserDefaults.standardUserDefaults().objectForKey("toDoTitle"){
            
            item = []
            
            for( var i = 0; i < storedToDoItems.count; i++ ){
            
                item.append(storedToDoItems[i] as NSString)
            }
        
        }
        
        tasksTable?.reloadData()
    }
    
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath){
    
        if( editingStyle == UITableViewCellEditingStyle.Delete){
            
            item.removeAtIndex(indexPath.row)
            
            let fixedToDoItems = item
            
            NSUserDefaults.standardUserDefaults().setObject(fixedToDoItems, forKey: "toDoTitle")
            NSUserDefaults.standardUserDefaults().synchronize()
            
            tasksTable?.reloadData()
            
        }
    }


}