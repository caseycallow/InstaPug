//
//  FavoriteLabel.swift
//  InstaPug
//
//  Created by Casey Callow on 8/2/19.
//  Copyright © 2019 caseycallow. All rights reserved.
//

import UIKit

class FavoriteLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupStyles()
    }
    
    private func setupStyles() {
        textColor = .black
        font = UIFont.systemFont(ofSize: 17)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
