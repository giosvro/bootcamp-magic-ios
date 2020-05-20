//
//  FavoritesView.swift
//  Bootcamp Magic
//
//  Created by mariaelena.silveira on 20/05/20.
//  Copyright © 2020 mariaelena.silveira. All rights reserved.
//

import UIKit

class FavoritesView: UIView {
    var titleLabel: UILabel
    
    weak var delegate: ViewDelegate?
    
    override init(frame: CGRect) {
        titleLabel = UILabel()
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension FavoritesView: ViewCoding {
    func hierarchyView() {
        addView(titleLabel)
    }
    
    func constraintView() {
        NSLayoutConstraint.activate(
            [titleLabel.widthAnchor.constraint(equalToConstant: 70),
             titleLabel.heightAnchor.constraint(equalToConstant: 78),
             titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
             titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor)]
        )
    }
    
    func aditionalConfigView() {
        titleLabel.backgroundColor = .cyan
//        self.backgroundColor = .cyan
    }
    
    
}
