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

enum NetworkResponse: Error {
    case badRequest
    case forbidden
    case internalServerError
    case serviceUnavailable
    case notConnected
    case timeout
    case internalError
    case unknown
}

extension NetworkManager: HTTPServicesProtocol {
    
    func makeRequest<T: Decodable>(endpoint: MagicApi, completion: @escaping RequestCallback<T>) {
        
        self.cancelTasks()

        router.request(endpoint) { (data, response, error) in
            if let error = error {
                let nsError = error as NSError
                completion(.failure(self.parseError(with: nsError.code)))
                return
            }
            
            if let response = response as? HTTPURLResponse,
                !Array(200...300).contains(response.statusCode) {
                completion(.failure(self.parseError(with: response.statusCode)))
                return
            }
            
            guard let data = data else {
                completion(.failure(.badRequest))
                return
            }
            
            self.treatSucess(data: data, completion: completion)
        }
    }
    
    func cancelTasks() {
        router.cancel()
    }
    
    private func treatSucess<T: Decodable>(data: Data, completion: RequestCallback<T>) {
        do {
            let object = try JSONDecoder().decode(T.self, from: data)
            completion(.success(object))
        } catch {
            completion(.failure(.badRequest))
        }
    }
    
    func parseError(with code: Int) -> NetworkResponse {
        switch code {
        case NSURLErrorNotConnectedToInternet:
            return .notConnected
        case NSURLErrorTimedOut:
            return .timeout
        case 400...499:
            return .badRequest
        case 500...599:
            return .internalError
        default:
            return .unknown
        }
    }
}
