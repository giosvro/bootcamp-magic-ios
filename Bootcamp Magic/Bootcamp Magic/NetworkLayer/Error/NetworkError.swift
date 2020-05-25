//
//  NetworkError.swift
//  Bootcamp Magic
//
//  Created by giovanni.s.barros on 20/05/20.
//  Copyright © 2020 mariaelena.silveira. All rights reserved.
//

import Foundation

public enum NetworkError: String, Error {
    case parametersNil = "Parameters were Nil."
    case encodingFail = "Parameter encoding Fail."
    case missingURL = "URL is Nil. "
}
