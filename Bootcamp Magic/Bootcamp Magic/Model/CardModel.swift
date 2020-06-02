//
//  CardModel.swift
//  Bootcamp Magic
//
//  Created by giovanni.s.barros on 21/05/20.
//  Copyright © 2020 mariaelena.silveira. All rights reserved.
//

import Foundation

struct CardApiResponse {
    var cards: [Card]
}

extension CardApiResponse: Decodable {
    
    private enum CardApiResponseCodingKeys: String, CodingKey {
        case cards
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CardApiResponseCodingKeys.self)
        cards = try container.decode([Card].self, forKey: .cards)
    }
}

struct Card {
    let id: String
    let name: String
    let types: [String]
    let set: String
    let imageUrl: String?
}

extension Card: Decodable {
    
    enum CardCodingKeys: String, CodingKey {
        case id
        case name
        case types
        case set
        case imageUrl
    }
    
    init(from decoder: Decoder) throws {
        let cardContainer = try decoder.container(keyedBy: CardCodingKeys.self)
        
        id = try cardContainer.decode(String.self, forKey: .id)
        name = try cardContainer.decode(String.self, forKey: .name)
        types = try cardContainer.decode([String].self, forKey: .types)
        set = try cardContainer.decode(String.self, forKey: .set)
        imageUrl = try? cardContainer.decode(String.self, forKey: .imageUrl)
    }
    
    init(card: CardCoreData) {
        id = card.id!
        name = card.name!
        types = []
        set = card.set!
        imageUrl = card.imageUrl
    }
}
