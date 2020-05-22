//
//  FavoritesView.swift
//  Bootcamp Magic
//
//  Created by mariaelena.silveira on 20/05/20.
//  Copyright © 2020 mariaelena.silveira. All rights reserved.
//

import UIKit

class FavoritesView: UIView {
    
    var button : UIButton
    var blurredBackgroundImageView: UIImageView
    
    weak var delegate: ViewDelegate?
    
    override init(frame: CGRect) {
        button = UIButton()
        blurredBackgroundImageView = UIImageView()
        super.init(frame: frame)
        blurredBackgroundImageView.frame = frame
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension FavoritesView: ViewCoding {
    func hierarchyView() {
        addView(blurredBackgroundImageView, button)
    }
    
    func constraintView() {

        NSLayoutConstraint.activate(
            [button.widthAnchor.constraint(equalToConstant: 80),
             button.heightAnchor.constraint(equalToConstant: 50),
             button.centerYAnchor.constraint(equalTo: centerYAnchor),
             button.centerXAnchor.constraint(equalTo: centerXAnchor)
            ]
        )
        
    }
    
    func aditionalConfigView() {
        button.setTitle("tela de detalhes", for: .normal)
        button.addTarget(self, action: #selector(showCardDetails(_:)), for: .touchUpInside)
        button.backgroundColor = .white
        blurredBackgroundImageView.image = UIImage(named: "background")
        blurredBackgroundImageView.blurImage()
    }
    
    @objc private func showCardDetails(_ sender: UIButton) {
        delegate?.didButtonPressed()
    }
    
}

