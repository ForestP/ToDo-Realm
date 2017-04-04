//
//  ReusableView.swift
//  ToDo-Realm
//
//  Created by Forest Plasencia on 4/4/17.
//  Copyright © 2017 Forest Plasencia. All rights reserved.
//

import UIKit

protocol ReusableView: class {}

extension ReusableView where Self: UIView {
    
    static var reuseIdentifier : String {
        return String(describing: self)
    }
}
