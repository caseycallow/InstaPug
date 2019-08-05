//
//  UICollectionView.swift
//  InstaPug
//
//  Created by Casey Callow on 8/5/19.
//  Copyright © 2019 caseycallow. All rights reserved.
//

import UIKit

extension UICollectionView {
    
    func register<T: UICollectionViewCell>(_ cell: T.Type) {
        register(cell, forCellWithReuseIdentifier: T.reuseIdentifier)
    }
    
    func dequeue<T: UICollectionViewCell>(_: T.Type, for indexPath: IndexPath) -> T {
        return dequeueReusableCell(withReuseIdentifier: T.reuseIdentifier, for: indexPath) as! T
    }
}
