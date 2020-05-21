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

enum NetworkResponse: String {
    case success
    case authenticationError = "You need to be authenticated first"
    case badRequest = "We could not process that action"
    case failed = "Network request failed"
    case noData = "The requested resource could not be found"
    case unableToDecode = "We could not decote the response"
    case forbidden = "You exceeded the rate limit"
    case internalServerError = "We had a problem with our server. Please try again later"
    case serviceUnavailable = "We are temporarily offline for maintenance. Please try again later"
    
    fileprivate func handleNetworkResponse(_ response: HTTPURLResponse) -> Result<String> {
        switch response.statusCode {
        case 400:
            return .failure(NetworkResponse.badRequest.rawValue)
        case 403:
            return .failure(NetworkResponse.forbidden.rawValue)
        case 404:
            return .failure(NetworkResponse.noData.rawValue)
        case 500:
            return .failure(NetworkResponse.internalServerError.rawValue)
        case 503:
            return .failure(NetworkResponse.serviceUnavailable.rawValue)
        case 401...500:
            return .failure(NetworkResponse.authenticationError.rawValue)
        case 501...599:
            return .failure(NetworkResponse.badRequest.rawValue)
        default:
            return .failure(NetworkResponse.failed.rawValue)
        }
    }
}

enum Result<String> {
    case sucess
    case failure(String)
}
