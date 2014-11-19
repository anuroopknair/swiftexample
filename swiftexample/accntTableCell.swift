//
//  accntTableCell.swift
//  swiftexample
//
//  Created by shan2 on 10/11/14.
//  Copyright (c) 2014 Neologix Pvt Ltd. All rights reserved.
//

    import Foundation
    import UIKit
    
    class accntTableCell: UITableViewCell
    {
        @IBOutlet weak var headingLbl: UILabel!
        @IBOutlet weak var userLbl: UILabel!
        @IBOutlet weak var passLbl: UILabel!
        
        override func awakeFromNib() {
            super.awakeFromNib()
        }
        
        override func setSelected(selected: Bool, animated: Bool){
            super.setSelected(selected, animated: animated)
        }
    
    
}