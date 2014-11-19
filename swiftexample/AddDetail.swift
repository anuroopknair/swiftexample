//
//  AddDetail.swift
//  swiftexample
//
//  Created by shan2 on 27/10/14.
//  Copyright (c) 2014 Neologix Pvt Ltd. All rights reserved.
//

import UIKit
//import sqllitehelper.swift

class AddDetail: UIViewController,UITextFieldDelegate,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet var titleText: UITextField!
    @IBOutlet var usernameTxt: UITextField!
    @IBOutlet var passwordTxt: UITextField!
    @IBOutlet var saveBtn:UIButton!
    @IBOutlet var backView:UIView!
    
    var accloadTblView : UITableView!
    
     var timer : NSTimer!
    
    var arrayOfAccs : NSMutableArray!
    var myArray:[String]!
    var myArrayBackup:[String]!
    
    let appDelegate = UIApplication.sharedApplication().delegate as AppDelegate
    var array_data: NSMutableArray = []

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        
    
      
     
        backView.layer.masksToBounds=true;
        backView.layer.cornerRadius=5.0;
        backView.layer.borderWidth=1;
        backView.layer.borderColor = UIColor(red:0.0/255.0, green:128.0/255.0, blue:255.0/255.0, alpha:1).CGColor;
        
        saveBtn.layer.masksToBounds=true;
        saveBtn.layer.cornerRadius=5;
        
         myArray = [String]()
        
       myArray = ["ab","abc","abd","abde","bef","befcd","kgh","deff","akhil","anurop"] as [String]
        
       myArrayBackup = myArray
        
        
        
        
        
            }
    
    
    func tableView(tableView:UITableView, numberOfRowsInSection section:Int) -> Int {
        return myArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell_ : UITableViewCell? = tableView.dequeueReusableCellWithIdentifier("CELL_ID") as? UITableViewCell
        if(cell_ == nil)
        {
            cell_ = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "CELL_ID")
        }
    
        cell_!.textLabel!.text = myArray[indexPath.row]
        
        var logoimg : UIImageView = UIImageView(frame: CGRectMake(0, 0, 10, 10))
        cell_?.addSubview(logoimg)
        
       logoimg.image=UIImage(named: "gg+")
        
        
        return cell_!
        
    }
    

    
 
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        titleText.text = "abc"
        accloadTblView.removeFromSuperview()
    }


     @IBAction func insertFunc(sender : AnyObject)
    {
        
        
        if titleText.text == ""
        {
            var alert = UIAlertController(title: "Mandatory", message: "Title cannot be empty", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
 
        }
        else if usernameTxt.text == ""
        {
            var alert = UIAlertController(title: "Mandatory", message: "Username cannot be empty", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
            
        }
        else if passwordTxt.text == ""
        {
            var alert = UIAlertController(title: "Mandatory", message: "Password cannot be empty", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
            
        }
        else
        {
        
            var dict : NSMutableDictionary = ["Title":"'"+titleText.text+"'" ,"userid":"'"+usernameTxt.text+"'","pass":"'"+passwordTxt.text+"'"]
            let obj = sqllitehelper()
            var status :Int8 = obj.dbInsert(dict, tableName: "pass_tbl")
        
        if status == 0
        {
            var alert = UIAlertController(title: "Failed", message: "Title already exists", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        }
        else
        {
            var alert = UIAlertController(title: "Success", message: "Added successfully", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        }
        var returndata : NSArray = obj.dbSelect("select * from pass_tbl")
        println(returndata)
        }
        /*
        var returndata : NSArray = obj.dbSelect("select * from pass_tbl")
        println(returndata)
        
        
        dict = ["Title":"'Yahoo'"]
        status = obj.dbUpdate(dict, tableName: "pass_tbl", condition: "Title = 'Google'")
        NSLog("%d", status)
        
        
        returndata = obj.dbSelect("select * from pass_tbl")
        println(returndata)
        
        
        status = obj.dbDelete("delete from pass_tbl where Title = 'Yahoo'")
        NSLog("%d", status)
        
        returndata  = obj.dbSelect("select * from pass_tbl")
        println(returndata)
        */
      
        
    }
    
    func timerInvoke()
    {
      //  timer = NSTimer.scheduledTimerWithTimeInterval(5.0, target: self, selector: Selector("update"), userInfo: nil, repeats: false)
    }
    func timerInvalidat()
    {
        
        timer.invalidate()
        timer=nil
    }
  func textFieldShouldBeginEditing(textField: UITextField) -> Bool
    {
       if accloadTblView != nil
       {
        accloadTblView.removeFromSuperview()
        
        }
         accloadTblView   = UITableView(frame: CGRectMake(titleText.frame.origin.x, titleText.frame.origin.y+titleText.frame.size.height, titleText.frame.size.width,100))
        backView.addSubview(accloadTblView)
        accloadTblView.delegate=self
        accloadTblView.dataSource=self
        
        
    return true
    }
    
    
     func textField(textField: UITextField,
        shouldChangeCharactersInRange range: NSRange,
        replacementString string: String) -> Bool
    {
myArray=myArrayBackup
        
        var substring : NSString = titleText.text
        substring = substring.stringByReplacingCharactersInRange(range, withString: string)
        var mysortedarray  = [String]()
        
        
        for var i = 0; i < myArray.count; i++
        {
            var curString : NSString = myArray[i] as NSString
            var substringRange : NSRange  = curString.rangeOfString(substring)
            if substringRange.location == 0
            {
                mysortedarray.append(curString)
            }
        }
      
        
        myArrayBackup=myArray
        myArray = mysortedarray
        
       accloadTblView.reloadData()
        
        
    return true
        
    }
   /*
   
    */
    
     func textFieldDidBeginEditing(textField: UITextField)
     {
        NSLog("textfieldDidBeginEditing")
    }
     func textFieldShouldEndEditing(textField: UITextField) -> Bool
     {
          NSLog("textfieldDidBeginEditing")
        return true
    }
    
    func textFieldShouldReturn(textField: UITextField!) -> Bool {   //delegate method

          //  textField.becomeFirstResponder()
     
        textField.resignFirstResponder()
        return true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
