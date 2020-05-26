//
//  HTTPServicesProtocol.swift
//  Bootcamp Magic
//
//  Created by giovanni.s.barros on 26/05/20.
//  Copyright © 2020 mariaelena.silveira. All rights reserved.
//

import Foundation

typealias RequestCallback<T> = (Result<T, NetworkResponse>) -> Void

protocol HTTPServicesProtocol {
    func makeRequest<T: Decodable>(endpoint: MagicApi, completion: @escaping RequestCallback<T>)
    func cancelTasks()
}

extension HTTPServicesProtocol {
    func cancelTasks() { }
}
