//
//  third.swift
//  swiftexample
//
//  Created by shan2 on 23/10/14.
//  Copyright (c) 2014 Neologix Pvt Ltd. All rights reserved.
//

import UIKit


class third: UIViewController {
    
    @IBOutlet var btn1 : UIButton!
    @IBOutlet var btn2 : UIButton!
    @IBOutlet var btn3 : UIButton!
    @IBOutlet var btn4 : UIButton!
    @IBOutlet var btn5 : UIButton!
    @IBOutlet var btn6 : UIButton!
    @IBOutlet var btn7 : UIButton!
    @IBOutlet var btn8 : UIButton!
    @IBOutlet var btn9 : UIButton!
    @IBOutlet var btn0 : UIButton!
    
    @IBOutlet var backBtn :UIButton!
    
    @IBOutlet var passCodeText : UITextField!
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var arrayOfObjects : NSMutableArray!
        
            
        
        
        
        
        
        
        
        

        // Do any additional setup after loading the view.
        
        var color: UIColor = UIColor(red:153.0/255.0, green:153.0/255.0, blue:153.0/255.0, alpha:1);
        var btnBorderColor=color;
        var btnTextColor=color;
        var btnBorderWidth:CGFloat=1.0;
        
        NSLog("am in sift third class");
        btn1.backgroundColor=UIColor.clearColor();
        btn1.layer.masksToBounds=true;
        btn1.layer.cornerRadius=5.0;
        btn1.layer.borderWidth=btnBorderWidth;
        btn1.setTitleColor(btnTextColor, forState: UIControlState.Normal);
        btn1.layer.borderColor=btnBorderColor.CGColor;
        
        btn2.backgroundColor=UIColor.clearColor();
        btn2.layer.masksToBounds=true;
        btn2.layer.cornerRadius=5.0;
        btn2.layer.borderWidth=btnBorderWidth;
        btn2.setTitleColor(btnTextColor, forState: UIControlState.Normal);
        btn2.layer.borderColor=btnBorderColor.CGColor;
        
        btn3.backgroundColor=UIColor.clearColor();
        btn3.layer.masksToBounds=true;
        btn3.layer.cornerRadius=5.0;
        btn3.layer.borderWidth=btnBorderWidth;
        btn3.setTitleColor(btnTextColor, forState: UIControlState.Normal);
        btn3.layer.borderColor=btnBorderColor.CGColor;
        
        
        
        btn4.backgroundColor=UIColor.clearColor();
        btn4.layer.masksToBounds=true;
        btn4.layer.cornerRadius=5.0;
        btn4.layer.borderWidth=btnBorderWidth;
        btn4.setTitleColor(btnTextColor, forState: UIControlState.Normal);
        btn4.layer.borderColor=btnBorderColor.CGColor;
        
        
        btn5.backgroundColor=UIColor.clearColor();
        btn5.layer.masksToBounds=true;
        btn5.layer.cornerRadius=5.0;
        btn5.layer.borderWidth=btnBorderWidth;
        btn5.setTitleColor(btnTextColor, forState: UIControlState.Normal);
        btn5.layer.borderColor=btnBorderColor.CGColor;
        
        
        btn6.backgroundColor=UIColor.clearColor();
        btn6.layer.masksToBounds=true;
        btn6.layer.cornerRadius=5.0;
        btn6.layer.borderWidth=btnBorderWidth;
        btn6.setTitleColor(btnTextColor, forState: UIControlState.Normal);
        btn6.layer.borderColor=btnBorderColor.CGColor;
        
        
        
        btn7.backgroundColor=UIColor.clearColor();
        btn7.layer.masksToBounds=true;
        btn7.layer.cornerRadius=5.0;
        btn7.layer.borderWidth=btnBorderWidth;
        btn7.setTitleColor(btnTextColor, forState: UIControlState.Normal);
        btn7.layer.borderColor=btnBorderColor.CGColor;
        
        
        btn8.backgroundColor=UIColor.clearColor();
        btn8.layer.masksToBounds=true;
        btn8.layer.cornerRadius=5.0;
        btn8.layer.borderWidth=btnBorderWidth;
        btn8.setTitleColor(btnTextColor, forState: UIControlState.Normal);
        btn8.layer.borderColor=btnBorderColor.CGColor;
        
        
        
        btn9.backgroundColor=UIColor.clearColor();
        btn9.layer.masksToBounds=true;
        btn9.layer.cornerRadius=5.0;
        btn9.layer.borderWidth=btnBorderWidth;
        btn9.setTitleColor(btnTextColor, forState: UIControlState.Normal);
        btn9.layer.borderColor=btnBorderColor.CGColor;
        
        
        
        
        btn0.backgroundColor=UIColor.clearColor();
        btn0.layer.masksToBounds=true;
        btn0.layer.cornerRadius=5.0;
        btn0.layer.borderWidth=btnBorderWidth;
        btn0.setTitleColor(btnTextColor, forState: UIControlState.Normal);
        btn0.layer.borderColor=btnBorderColor.CGColor;
        
        
        backBtn.backgroundColor=UIColor.clearColor();
        backBtn.layer.masksToBounds=true;
        backBtn.layer.cornerRadius=5.0;
        backBtn.layer.borderWidth=btnBorderWidth;
        backBtn.setTitleColor(btnTextColor, forState: UIControlState.Normal);
        backBtn.layer.borderColor=btnBorderColor.CGColor;
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func backSpaceBtnAction(sender :AnyObject){
        
        var passcodeString = passCodeText.text
        
        var length=passcodeString.lengthOfBytesUsingEncoding(NSUTF8StringEncoding);
        if(length>1)
        {
      passcodeString =  passcodeString.substringWithRange(Range<String.Index>(start: passcodeString.startIndex, end: advance(passcodeString.endIndex, -1)))
            passCodeText.text=passcodeString;
        }
        else
        {
            passCodeText.text="";
        }
        
    }
    
   @IBAction func numericBtnAction(sender : AnyObject) {
    
    var stringpass1:NSString=passCodeText.text;
    
    var count = stringpass1.length;
    
    if(count<5)
    {

    var number=sender.tag;
    
    var str = NSString(format:"%d", number);
    
    var stringpass=passCodeText.text+str;
        
        passCodeText.text=stringpass;
    }
        else
        {
        NSLog("success");
            
            performSegueWithIdentifier("listsegue", sender: sender);
    
        }
    
    }
    
  
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if (segue.identifier == "listsegue") {
            NSLog("list seque");
        }
    }
   
}
