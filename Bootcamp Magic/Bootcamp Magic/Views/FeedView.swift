//
//  FeedView.swift
//  Bootcamp Magic
//
//  Created by mariaelena.silveira on 20/05/20.
//  Copyright © 2020 mariaelena.silveira. All rights reserved.
//

import UIKit

class FeedView: UIView {
    
    var button : UIButton
    var searchBar: UISearchBar
    var blurredBackgroundImageView: UIImageView
    
    weak var delegate:  ViewDelegate?
    
    override init(frame: CGRect) {
        button = UIButton()
        searchBar = UISearchBar()
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
        addView(blurredBackgroundImageView, button, searchBar)
    }
    
    func constraintView() {
        NSLayoutConstraint.activate(
            [button.heightAnchor.constraint(equalToConstant: 50),
             button.widthAnchor.constraint(equalToConstant: 50),
             button.centerYAnchor.constraint(equalTo: centerYAnchor),
             button.centerXAnchor.constraint(equalTo: centerXAnchor),
            ]
        )
        
        NSLayoutConstraint.activate(
            [searchBar.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
             searchBar.trailingAnchor.constraint(equalTo: trailingAnchor),
             searchBar.leadingAnchor.constraint(equalTo: leadingAnchor)
            ]
        )
        
    }
    
    func aditionalConfigView() {
        searchBar.placeholder = "Search for cards"
        searchBar.backgroundImage = UIImage()
        searchBar.showsCancelButton = true
        searchBar.tintColor = .white
        
        button.setTitle("tela de detalhes", for: .normal)
        button.addTarget(self, action: #selector(showCardDetails(_:)), for: .touchUpInside)
        button.backgroundColor = .cyan
        
        blurredBackgroundImageView.image = UIImage(named: "background")
        blurredBackgroundImageView.blurImage()
    }
    
    @objc private func showCardDetails(_ sender: UIButton) {
           delegate?.didButtonPressed()
    }
       
}
