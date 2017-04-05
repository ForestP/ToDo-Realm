//
//  TaskView.swift
//  ToDo-Realm
//
//  Created by Forest Plasencia on 4/5/17.
//  Copyright © 2017 Forest Plasencia. All rights reserved.
//

import UIKit

class TaskView: UIView {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let BOX_BORDER = UIColor(red: 1, green: 1, blue: 1, alpha: 0.3)
        
        layer.borderWidth = 1
        layer.cornerRadius = 5.0
        
        layer.borderColor = BOX_BORDER.cgColor
        
    }
    
}
