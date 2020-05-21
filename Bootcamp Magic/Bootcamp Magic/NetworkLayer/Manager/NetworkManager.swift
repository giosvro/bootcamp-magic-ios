//
//  NetworkManager.swift
//  Bootcamp Magic
//
//  Created by giovanni.s.barros on 20/05/20.
//  Copyright © 2020 mariaelena.silveira. All rights reserved.
//

import Foundation

struct NetworkManager {
    static let environment: NetworkEnviroment = .production
    static let APIKey = "API_KEY"
    private let router = Router<MagicApi>()
}
