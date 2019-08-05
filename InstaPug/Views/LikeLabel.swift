//
//  LikeLabel.swift
//  InstaPug
//
//  Created by Casey Callow on 8/2/19.
//  Copyright © 2019 caseycallow. All rights reserved.
//

import UIKit

class LikeLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupStyles()
    }
    
    private func setupStyles() {
        text = "0 Likes"
        textColor = .black
        font = UIFont(name: "Lato-Bold", size: 14)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
