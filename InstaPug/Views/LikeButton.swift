//
//  LikeButton.swift
//  InstaPug
//
//  Created by Casey Callow on 8/2/19.
//  Copyright © 2019 caseycallow. All rights reserved.
//

import UIKit

class LikeButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupStyles()
        addActions()
    }
    
    private func setupStyles() {
        setImage(UIImage(named: "heart"), for: .normal)
        setImage(UIImage(named: "heartFilled"), for: .selected)
        imageView?.contentMode = .scaleAspectFit
        withHeight(24)
    }
    
    private func addActions() {
        addTarget(self, action: #selector(toggle(_:)), for: .touchUpInside)
    }
    
    @objc private func toggle(_ sender: LikeButton) {
        sender.isSelected = !sender.isSelected
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
