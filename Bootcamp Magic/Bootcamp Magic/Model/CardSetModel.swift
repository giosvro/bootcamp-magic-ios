//
//  CardSetModel.swift
//  Bootcamp Magic
//
//  Created by giovanni.s.barros on 21/05/20.
//  Copyright © 2020 mariaelena.silveira. All rights reserved.
//

import Foundation

struct SetApiResponse {
    var sets: [CardSet]
}

extension SetApiResponse: Decodable {
    
    private enum SetApiResponseCodingKeys: String, CodingKey {
        case sets
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: SetApiResponseCodingKeys.self)
        sets = try container.decode([CardSet].self, forKey: .sets)
    }
}

struct CardSet {
    let code: String
    let name: String
}

extension CardSet: Decodable {
    
    enum SetCodingKeys: String, CodingKey {
        case code
        case name
    }
    
    init(from decoder: Decoder) throws {
        let cardContainer = try decoder.container(keyedBy: SetCodingKeys.self)
        
        code = try cardContainer.decode(String.self, forKey: .code)
        name = try cardContainer.decode(String.self, forKey: .name)
    }
}
