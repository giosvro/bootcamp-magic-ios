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
    var activityView: UIView
    var collectionView: UICollectionView
    var blurredBackgroundImageView: UIImageView
    
    var errorLabel: UILabel = {
        let errorLabel = UILabel()
        errorLabel.textColor = .white
        errorLabel.font = UIFont(name: "Gotham-Black", size: 16.0)
        errorLabel.numberOfLines = 2
        return errorLabel
    }()
    
    var label: UILabel = {
          let label = UILabel()
          label.text = "How about these cards?"
          label.textColor = .white
          label.font = UIFont(name: "Gotham-Black", size: 32.0)
          label.numberOfLines = 2
          return label
    }()
      
    override init(frame: CGRect) {
        searchBar = UISearchBar()
        errorLabel = UILabel()
        collectionView = UICollectionView(frame: frame, collectionViewLayout: .init())
        blurredBackgroundImageView = UIImageView()
        activityView = UIView()
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
        addView(blurredBackgroundImageView, searchBar, label, collectionView, activityView, errorLabel)
    }
    
    func constraintView() {
        
        NSLayoutConstraint.activate(
            [searchBar.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
             searchBar.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
             searchBar.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15)
            ]
        )
        
        NSLayoutConstraint.activate(
            [label.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 5),
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
        
        NSLayoutConstraint.activate(
            [activityView.centerXAnchor.constraint(equalTo: centerXAnchor),
             activityView.centerYAnchor.constraint(equalTo: centerYAnchor)
            ]
        )
        
        NSLayoutConstraint.activate(
            [errorLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
             errorLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
            ]
        )
        
    }
    
    func aditionalConfigView() {
        searchBar.configureSearchBar()
        
        blurredBackgroundImageView.image = UIImage(named: "background")
        blurredBackgroundImageView.blurImage()
        
        activityView.activityStartAnimating()
        
        collectionView.setupCollectionView()
        collectionView.register(CardCollectionViewCell.self)
        collectionView.isHidden = true
    }
    
}


