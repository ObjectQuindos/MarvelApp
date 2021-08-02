//
//  Errors.swift
//  MarvelApp
//
//  Created by David López Quindos on 2/8/21.
//

import Foundation

import Foundation

class ChallengeError: Error {
    
    public let code: ErrorCode
    public let message: String?
    public let networkError: Error?
    public let networkStatus: String?
    
    public init(code: ErrorCode, message: String?, networkError: Error?, status: String?) {
        self.code = code
        self.message = message
        self.networkError = networkError
        self.networkStatus = status
    }
    
    static func genericError(message: String) -> ChallengeError {
        return ChallengeError(code: .genericError, message: message, networkError: nil, status: nil)
    }
}

public enum ErrorCode: Int {
    
    case authError = 409
    case invalidRefer = 401
    case methodNotAllowed = 405
    case forbidden = 403
    case ko = 404
    case genericError = 0
    
    public static func fromInt(code: Int) -> ErrorCode {
        guard let realCode = ErrorCode(rawValue: code) else {
            return .ko
        }
        return realCode
    }
}
