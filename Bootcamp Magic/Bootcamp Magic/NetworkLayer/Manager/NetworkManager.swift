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
    case unableToDecode = "We could not decode the response"
    case forbidden = "You exceeded the rate limit"
    case internalServerError = "We had a problem with our server. Please try again later"
    case serviceUnavailable = "We are temporarily offline for maintenance. Please try again later"
}

enum Result<String> {
    case success
    case failure(String)
}

extension NetworkManager {
    
    fileprivate func handleNetworkResponse(_ response: HTTPURLResponse) -> Result<String> {
        switch response.statusCode {
        case 200...299:
            return .success
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
    
    func getAllCards(page: Int, set: String, type: String,
                     completion: @escaping (_ cards: [Card]?,_ error: String?) -> ()) {
        
        router.request(.cards(page, set, type)) { data, response, error in
            
            if error != nil {
                completion(nil, "Please check your network connection")
            }
            
            if let response = response as? HTTPURLResponse {
                let result = self.handleNetworkResponse(response)
                
                switch result {
                case .success:
                    guard let responseData = data else {
                        completion(nil, NetworkResponse.noData.rawValue)
                        return
                    }
                    do {
                        let apiResponse = try JSONDecoder().decode(CardApiResponse.self,
                                                                   from: responseData)
                        completion(apiResponse.cards, nil)
                    } catch {
                        completion(nil, NetworkResponse.unableToDecode.rawValue)
                    }
                    
                case .failure(let networkFailureError):
                    completion(nil, networkFailureError)
                }
            }
        }
    }
    
    func getAllCardsWithName(name: String, contains: String,
                     completion: @escaping (_ cards: [Card]?,_ error: String?) -> ()) {
        
        router.request(.cardsWithName(name)) { data, response, error in
            
            if error != nil {
                completion(nil, "Please check your network connection")
            }
            
            if let response = response as? HTTPURLResponse {
                let result = self.handleNetworkResponse(response)
                
                switch result {
                case .success:
                    guard let responseData = data else {
                        completion(nil, NetworkResponse.noData.rawValue)
                        return
                    }
                    do {
                        let apiResponse = try JSONDecoder().decode(CardApiResponse.self,
                                                                   from: responseData)
                        completion(apiResponse.cards, nil)
                    } catch {
                        completion(nil, NetworkResponse.unableToDecode.rawValue)
                    }
                    
                case .failure(let networkFailureError):
                    completion(nil, networkFailureError)
                }
            }
        }
    }
    
    func getAllSets(completion: @escaping (_ sets: [CardSet]?,_ error: String?) -> ()) {
        router.request(.sets) { (data, response, error) in
            
            if error != nil {
                completion(nil, "Please check your network connection")
            }
            
            if let response = response as? HTTPURLResponse {
                let result = self.handleNetworkResponse(response)
                
                switch result {
                case .success:
                    guard let responseData = data else {
                        completion(nil, NetworkResponse.noData.rawValue)
                        return
                    }
                    do {
                        let apiResponse = try JSONDecoder().decode(SetApiResponse.self,
                                                                   from: responseData)
                        completion(apiResponse.sets, nil)
                    } catch {
                        completion(nil, NetworkResponse.unableToDecode.rawValue)
                    }
                    
                case .failure(let networkFailureError):
                    completion(nil, networkFailureError)
                }
            }
        }
    }
    
    func getAllTypes(completion: @escaping (_ sets: [String]?,_ error: String?) -> ()) {
        router.request(.types) { (data, response, error) in
            
            if error != nil {
                completion(nil, "Please check your network connection")
            }
            
            if let response = response as? HTTPURLResponse {
                let result = self.handleNetworkResponse(response)
                
                switch result {
                case .success:
                    guard let responseData = data else {
                        completion(nil, NetworkResponse.noData.rawValue)
                        return
                    }
                    do {
                        let apiResponse = try JSONDecoder().decode(CardTypeApiResponse.self,
                                                                   from: responseData)
                        completion(apiResponse.types, nil)
                    } catch {
                        completion(nil, NetworkResponse.unableToDecode.rawValue)
                    }
                    
                case .failure(let networkFailureError):
                    completion(nil, networkFailureError)
                }
            }
        }
    }
}
