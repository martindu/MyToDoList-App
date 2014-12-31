//
//  SecondViewController.swift
//  MyToDoList App
//
//  Created by Martin Dureja on 12/30/14.
//  Copyright (c) 2014 Martin Dureja. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var enteredTitle: UITextField!
    
    @IBOutlet var enteredDetail: UITextField!
    
    @IBAction func pressedButton(sender: AnyObject) {
    
        var _title: String = " "
        var _detail: String = " "
    
        _title = enteredTitle.text!
        _detail = enteredDetail.text!
        
        //item.append((title: _title,detail: _detail))
        item.append(enteredTitle.text)
        
        let fixedToDoItems = item
        
        NSUserDefaults.standardUserDefaults().setObject(fixedToDoItems, forKey: "toDoTitle")
        NSUserDefaults.standardUserDefaults().synchronize()
        //var storedToDoItems: AnyObject? = NSUserDefaults.standardUserDefaults().objectForKey("toDoTitle")
     
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //println( NSUserDefaults.standardUserDefaults().objectForKey("toDoTitle") )
    }

    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    } // called when 'return' key pressed.Toggles down the keyboard
    
     override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        self.view.endEditing(true)
    } // toggles down keyboard when user touches anywhere on screen
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

