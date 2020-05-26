//
//  FeedView.swift
//  Bootcamp Magic
//
//  Created by mariaelena.silveira on 20/05/20.
//  Copyright © 2020 mariaelena.silveira. All rights reserved.
//

import UIKit

class FeedView: UIView {
    
    var searchBar: UISearchBar
    var label: UILabel
    var collectionView: UICollectionView
    var blurredBackgroundImageView: UIImageView
    
    weak var delegate:  ViewDelegate?
    
    override init(frame: CGRect) {
        searchBar = UISearchBar()
        label = UILabel()
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: .init())
        blurredBackgroundImageView = UIImageView()
        super.init(frame: frame)
        blurredBackgroundImageView.frame = frame
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension FeedView: ViewCoding {
    func hierarchyView() {
        addView(blurredBackgroundImageView, searchBar, label, collectionView)
    }
    
    func constraintView() {
        
        NSLayoutConstraint.activate(
            [searchBar.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
             searchBar.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
             searchBar.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15)
            ]
        )
        
        NSLayoutConstraint.activate(
            [label.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 10),
             label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 22),
             label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -22)
            ]
        )
        
        NSLayoutConstraint.activate(
            [collectionView.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 10),
             collectionView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 12),
             collectionView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -12),
             collectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
            ]
        )
        
    }
    
    func aditionalConfigView() {
        
        label.text = "How about these cards?"
        label.textColor = .white
        let font = UIFont(name: "Gotham-Black", size: 35.0)
        label.font = font
        label.numberOfLines = 2
        
        searchBar.placeholder = "Search for cards"
        searchBar.backgroundImage = UIImage()
        searchBar.showsCancelButton = true
        searchBar.tintColor = .white
        
        blurredBackgroundImageView.image = UIImage(named: "background")
        blurredBackgroundImageView.blurImage()
        
        collectionView.setupCollectionView()
        collectionView.register(CardCollectionViewCell.self)
        
        guard let feedViewController = delegate as? FeedViewController else {
            return
        }
        collectionView.delegate = feedViewController
    }
    
}


