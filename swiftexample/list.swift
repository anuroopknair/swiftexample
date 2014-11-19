//
//  list.swift
//  swiftexample
//
//  Created by shan2 on 24/10/14.
//  Copyright (c) 2014 Neologix Pvt Ltd. All rights reserved.
//

import UIKit

class list: UIViewController,UITableViewDelegate,UIPickerViewDataSource {
    var timer : NSTimer!
    
    //
    var pickr : UIPickerView!
    //@IBOutlet weak var table: UITableView!
    var returndata : NSArray!
 //  @IBOutlet  var accountCell: accntTableCell!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        
        let obj = sqllitehelper()
         returndata  = obj.dbSelect("select * from pass_tbl")
        
    //    pickr = UIPickerView()
     //   pickr.dataSource = self
     //   pickr.center = view.center
    //    view.addSubview(pickr)
        
        
   self.timerInvoke()

    }
    
    func timerInvoke()
    {
       //  timer = NSTimer.scheduledTimerWithTimeInterval(5.0, target: self, selector: Selector("update"), userInfo: nil, repeats: false)
    }
    func timerInvalidat()
    {
        
       // timer.invalidate()
      //  timer=nil
    }
    func update() {
        NSLog("timer function called")
        //[navigationController popViewControllerAnimated:YES];
        
    navigationController?.popViewControllerAnimated(true)
        
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   func tableView(tableView:UITableView, numberOfRowsInSection section:Int) -> Int {
        return 5//returndata.count
    }
    
     func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell : accntTableCell! = tableView.dequeueReusableCellWithIdentifier("Cell") as accntTableCell;
        if(cell == nil)
        {
            cell = NSBundle.mainBundle().loadNibNamed("Cell", owner: self, options: nil)[0] as accntTableCell;
        }
       // if UIScreen.mainScreen().bounds.size.height>768
        //{
       //     cell.ivWidthConstraint.constant = 100
    //    }
        
        //cell.loadItem(user: "asdf")
       // let stringTitle = returndata[indexPath.row] as String //NOT NSString
      
        cell.headingLbl.text="MY ACCOUNTS"
        cell.userLbl.text="anuroop.knair@nlindia.com"
     //   cell.passLbl.text="pass12$Pass123#"
     
        return cell as accntTableCell

    }
    
    func tableView(tableView: UITableView!, canEditRowAtIndexPath indexPath: NSIndexPath!) -> Bool {
        return true
    }
    
    func tableView(tableView: UITableView!, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath!) {
        if (editingStyle == UITableViewCellEditingStyle.Delete) {
            // handle delete (by removing the data from your array and updating the tableview)
        }
    }
    
    
    func tableView(tableView: UITableView!, editActionsForRowAtIndexPath indexPath: NSIndexPath!) -> [AnyObject]! {
       
    
   
    
    
        
        var deleteAction = UITableViewRowAction(style: .Default, title: "Delete") { (action, indexPath) -> Void in
            tableView.editing = false
            println("deleteAction")
        }
        deleteAction.backgroundColor = UIColor.redColor()
       var editAction = UITableViewRowAction(style: .Default, title: "More") { (action, indexPath) -> Void in
            tableView.editing = false
        
            println("More")
       
        
        
        }
        editAction.backgroundColor = UIColor.grayColor()
//        editAction.backgroundColor = UIColor.grayColor()
//        var useridAction = UITableViewRowAction(style: .Default, title: "Copy Userid") { (action, indexPath) -> Void in
//            tableView.editing = false
//            println("Copy userid")
//        }
//        
//        var passwordAction = UITableViewRowAction(style: .Default, title: "Copy") { (action, indexPath) -> Void in
//            tableView.editing = false
//            println("Copy password")
//        }
//        passwordAction.backgroundColor=UIColor.greenColor()
//        var showPassAction = UITableViewRowAction(style: .Default, title: "Show") { (action, indexPath) -> Void in
//            tableView.editing = false
//            println("Show password")
//        }
//        showPassAction.backgroundColor=UIColor.blueColor()
    return [deleteAction,editAction]
    }
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        if pickerView == pickr{
            return 1
        }
        return 0
    }
    
    func pickerView(pickerView: UIPickerView,
        numberOfRowsInComponent component: Int) -> Int {
            if pickerView == pickr{
                return 10
            }
            return 0
    }
    func pickerView(pickerView: UIPickerView,
        titleForRow row: Int,
        forComponent component: Int) -> String!{
            return "ddd"
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if (segue.identifier == "addSegue")
        {
            
           self.timerInvalidat()
        }
    }
    
   // [myTimer invalidate];
   // myTimer = nil;
}