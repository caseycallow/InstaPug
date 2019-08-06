//
//  RefreshControlLabel.swift
//  InstaPug
//
//  Created by Casey Callow on 8/6/19.
//  Copyright © 2019 caseycallow. All rights reserved.
//

import UIKit

class RefreshControlLabel: UILabel {
    
    public func configure(loading: Bool = true, failed: Bool = false) {
        let retryMessage = "Failed to download images. \nPull to refresh to try again."
        let loadingMessage = "Loading..."
        
        switch (loading, failed) {
        case let (loading, failed) where loading && !failed:
            text = loadingMessage
        case let (loading, failed) where !loading && failed:
            text = retryMessage
        case let (loading, failed) where !loading && !failed:
            text = ""
        default: return
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupStyles()
        configure()
    }
    
    private func setupStyles() {
        textColor = .darkGray
        font = UIFont.systemFont(ofSize: 14)
        textAlignment = .center
        numberOfLines = 0
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
