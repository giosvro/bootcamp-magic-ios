//
//  HTTPTask.swift
//  Bootcamp Magic
//
//  Created by giovanni.s.barros on 20/05/20.
//  Copyright © 2020 mariaelena.silveira. All rights reserved.
//

import Foundation

public enum HTTPTask {
    case request
    
    case requestParameters(_ bodyParameters: Parameters?,
        _ urlParameters: Parameters?)
    
    case requestParametersAndHeaders(_ bodyParameters: Parameters?,
        _ urlParameters: Parameters?,
        _ additionalHeaders: HTTPHeaders?)
}

public typealias HTTPHeaders = [String:String]
