//
//  UICollectionReusableView.swift
//  InstaPug
//
//  Created by Casey Callow on 8/5/19.
//  Copyright © 2019 caseycallow. All rights reserved.
//

import UIKit

extension UICollectionReusableView {
    
    class var reuseIdentifier: String {
        return NSStringFromClass(self)
    }
}
