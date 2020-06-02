//
//  CardDetailsView.swift
//  Bootcamp Magic
//
//  Created by mariaelena.silveira on 22/05/20.
//  Copyright © 2020 mariaelena.silveira. All rights reserved.
//

import UIKit

class CardDetailsView: UIView {
    
    var blurredBackgroundImageView: UIImageView
    var label: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 24, weight: .semibold)
        return label
    }()
    
    var cardImage: CardImageView = {
        let imageView = CardImageView()
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 20
        return imageView
    }()
    
    var quitButton: UIButton = {
        let button = UIButton()
        button.clipsToBounds = true
        button.setImage(UIImage(named: "quit-button"), for: .normal)
        return button
    }()
    
    var favoriteButton: UIButton = {
        let button = UIButton()
        button.clipsToBounds = true
        button.layer.cornerRadius = 12
        button.backgroundColor = .clear
        button.layer.borderWidth = 2
        button.layer.borderColor = CGColor(srgbRed: 1, green: 1, blue: 1, alpha: 1)
        button.titleLabel?.font = UIFont(name: "Gotham-Black", size: 20.0)
        return button
    }()
    
    weak var delegate: ViewDelegate?
    
    private var aspectRatio: CGFloat
    private var widthAspectRatio: CGFloat
    private var heightAspectRatio: CGFloat
    
    
    override init(frame: CGRect) {
        blurredBackgroundImageView = UIImageView()
        self.aspectRatio = 1.39
        self.heightAspectRatio = UIScreen.main.bounds.size.height*0.5
        self.widthAspectRatio = heightAspectRatio / aspectRatio
        super.init(frame: frame)
        blurredBackgroundImageView.frame = frame
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CardDetailsView: ViewCoding {
    func hierarchyView() {
        addView(blurredBackgroundImageView, cardImage, label, quitButton, favoriteButton)
    }
    
    func constraintView() {
        
        NSLayoutConstraint.activate(
            [blurredBackgroundImageView.topAnchor.constraint(equalTo: self.topAnchor),
             blurredBackgroundImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
             blurredBackgroundImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
             blurredBackgroundImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
            ]
        )
        
        NSLayoutConstraint.activate(
            [cardImage.widthAnchor.constraint(equalToConstant: self.widthAspectRatio),
             cardImage.heightAnchor.constraint(equalToConstant: self.heightAspectRatio),
             cardImage.bottomAnchor.constraint(equalTo: self.favoriteButton.topAnchor, constant: -120),
             cardImage.centerXAnchor.constraint(equalTo: self.centerXAnchor)
            ]
        )
        
        NSLayoutConstraint.activate(
            [quitButton.widthAnchor.constraint(equalToConstant: 40),
             quitButton.heightAnchor.constraint(equalToConstant: 40),
             quitButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 60),
             quitButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 27)
            ]
        )
        
        NSLayoutConstraint.activate(
            [favoriteButton.heightAnchor.constraint(equalToConstant: 65),
             favoriteButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 27),
             favoriteButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -27),
             favoriteButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -60),
            ]
        )
        
        NSLayoutConstraint.activate(
            [label.centerXAnchor.constraint(equalTo: cardImage.centerXAnchor),
             label.centerYAnchor.constraint(equalTo: cardImage.centerYAnchor, constant: 70),
             label.leadingAnchor.constraint(equalTo: cardImage.leadingAnchor, constant:  20),
             label.trailingAnchor.constraint(equalTo: cardImage.trailingAnchor, constant: -20),
            ]
        )
        
    }
    
    func aditionalConfigView() {
        blurredBackgroundImageView.image = UIImage(named: "background")
        blurredBackgroundImageView.blurImage()
    }
}
