//
//  LikeButton.swift
//  InstaPug
//
//  Created by Casey Callow on 8/2/19.
//  Copyright © 2019 caseycallow. All rights reserved.
//

import UIKit

class FavoriteButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupStyles()
    }
    
    private func setupStyles() {
        setImage(#imageLiteral(resourceName: "heart").withRenderingMode(.alwaysTemplate), for: .normal)
        imageView?.contentMode = .scaleAspectFit
        withHeight(24)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
