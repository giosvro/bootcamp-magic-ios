//
//  MovieApi.swift
//  Bootcamp Magic
//
//  Created by giovanni.s.barros on 20/05/20.
//  Copyright © 2020 mariaelena.silveira. All rights reserved.
//

import Foundation

enum NetworkEnviroment {
    case qa
    case production
    case staging
}

public enum MagicApi {
    case sets
    case types
    case cards(_ page: Int,_ set: String,_ type: String)
}

extension MagicApi: EndPointType {
    
    var environmentBaseURL : String {
        switch NetworkManager.environment {
        case .production:
            return "https://api.magicthegathering.io/v1/"
        case .qa:
            return "https://api.magicthegathering.io/v1/"
        case .staging:
            return "https://api.magicthegathering.io/v1/"
        }
    }
    
    var baseURL: URL {
        guard let url = URL(string: environmentBaseURL) else {
            fatalError("baseURL could not be configured.")
        }
        return url
    }
    
    var path: String {
        switch self {
        case .sets:
            return "sets"
        case .types:
            return "types"
        case .cards(let page, let set, let type):
            return "cards?page=\(page)&set=\(set)&type=\(type)&contains=imageUrl"
        }
    }
    
    var httpMethod: HTTPMethod {
        return .get
    }
    
    var task: HTTPTask {
        switch self {
        case .sets:
            return .request
        case .types:
            return .request
        case .cards(let page, let set, let type):
            return .requestParameters(nil, ["page": "\(page)",
                "sets": set, "types": type])
        }
    }
    
    var headers: HTTPHeaders? {
        return nil
    }
}
