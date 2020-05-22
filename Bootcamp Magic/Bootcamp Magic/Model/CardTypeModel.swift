//
//  CardTypeModel.swift
//  Bootcamp Magic
//
//  Created by giovanni.s.barros on 21/05/20.
//  Copyright © 2020 mariaelena.silveira. All rights reserved.
//

import Foundation

struct CardTypeApiResponse {
    var types: [String]
}

extension CardTypeApiResponse: Decodable {
    
    private enum SetApiResponseCodingKeys: String, CodingKey {
        case types
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: SetApiResponseCodingKeys.self)
        types = try container.decode([String].self, forKey: .types)
    }
}
