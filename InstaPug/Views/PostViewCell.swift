//
//  PostViewCell.swift
//  InstaPug
//
//  Created by Casey Callow on 8/1/19.
//  Copyright © 2019 caseycallow. All rights reserved.
//

import UIKit

class PostViewCell: UICollectionViewCell {
    
    public var postViewController: PostViewController?
    
    public var post: Post? {
        didSet {
            if let post = post {
                print("post from Cell: \(post)")
                loadImage(for: post)
                updateFavorites(for: post)
            }
        }
    }
    
    // MARK: Components
    
    lazy var favoriteButton = FavoriteButton()
    lazy var favoriteLabel = FavoriteLabel()
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    // MARK: Private Methods
    
    private func loadImage(for post: Post) {
        ImageLoader().loadImage(from: post.imageURL, for: self)
    }
    
    private func updateFavorites(for post: Post) {
        let favorited = post.isFavorited
        let totalFavorites = favorited ? post.totalFavorites + 1 : post.totalFavorites
        
        favoriteButton.tintColor = favorited ? UIColor.red : UIColor.gray
        favoriteLabel.text = formattedString(for: totalFavorites)

        print("updateFavorites called, totalFavs: \(totalFavorites)")
        
        favoriteButton.addTarget(self, action: #selector(favoriteButtonTapped), for: .touchUpInside)
    }
    
    private func formattedString(for favorites: Int) -> String {
        var singleFavorite: Bool {
            return favorites == 1
        }
        
        return "\(String(favorites)) like\(singleFavorite ? "" : "s")"
    }
    
    @objc private func favoriteButtonTapped(_ sender: FavoriteButton) {
        postViewController?.handleFavorite(for: self)
    }
    
    // MARK: UI
    
    private func layoutComponents() {
        stack(imageView,
              stack(favoriteButton,
                    favoriteLabel,
                    spacing: 8,
                    alignment: .leading).padLeft(16),
              spacing: 16)
            .withMargins(.init(top: 12, left: 0, bottom: 12, right: 0))
    }
    
    // MARK: Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layoutComponents()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
