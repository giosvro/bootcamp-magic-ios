//
//  ViewCoding.swift
//  Bootcamp Magic
//
//  Created by mariaelena.silveira on 20/05/20.
//  Copyright © 2020 mariaelena.silveira. All rights reserved.
//

import UIKit

protocol ViewCoding {
    func hierarchyView()
    func constraintView()
    func aditionalConfigView()
    func setup()
}

extension ViewCoding {
    func setup() {
        hierarchyView()
        constraintView()
        aditionalConfigView()
    }
}


