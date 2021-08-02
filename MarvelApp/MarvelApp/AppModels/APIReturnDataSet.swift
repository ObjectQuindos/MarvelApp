//
//  APIReturnDataSet.swift
//  MarvelApp
//
//  Created by David López Quindos on 2/8/21.
//

import Foundation

class APIReturnDataSet {
    let code: Int
    let status: String
    let value: [[String : Any]]
    var error: ChallengeError?
    
    init(fromJson json: [String : Any], response: URLResponse?) {
        self.code = json["code"] as? Int ?? 0
        self.status = json["status"] as? String ?? ""
        let data: [String : Any] = json["data"] as? [String : Any] ?? [String : Any]()
        self.value = data["results"] as? [[String : Any]] ?? []
        self.error = nil
        
        if self.code != 200 {
            let httpResponse = response as! HTTPURLResponse
            let message = json["code"] as? String
            let status = json["message"] as? String
            self.error = ChallengeError(code: ErrorCode.fromInt(code: httpResponse.statusCode), message: message, networkError: nil, status: status)
        }
    }
    
    init(error: Error, response: URLResponse?) {
        self.code = 0
        self.status = ""
        self.value = []
        
        let errorCode = ErrorCode.fromInt(code: self.code)
        let error = ChallengeError(code: errorCode, message: error.localizedDescription, networkError: nil, status: nil)
        self.error = error
    }
}
