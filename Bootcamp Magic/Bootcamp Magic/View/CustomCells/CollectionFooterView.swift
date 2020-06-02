//
//  CollectionFooterView.swift
//  Bootcamp Magic
//
//  Created by mariaelena.silveira on 01/06/20.
//  Copyright © 2020 mariaelena.silveira. All rights reserved.
//

import UIKit

class CollectionFooterView: UICollectionReusableView {
    var activityView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        activityView.backgroundColor = .red
        activityView.activityStartAnimating()
        addSubview(activityView)
        
        activityView.translatesAutoresizingMaskIntoConstraints = false
        activityView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        activityView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
