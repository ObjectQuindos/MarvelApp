//
//  NetworkConfiguration.swift
//  MarvelApp
//
//  Created by David López Quindos on 2/8/21.
//

import Foundation
import CryptoSwift

protocol NetworkConfiguration {
    var baseURL: URL { get }
    var path: String { get }
    var method: String { get }
    var parameters: [String : String] { get }
}

fileprivate struct MarvelAPIConfig {
    
    fileprivate static let keys = APIKeys.getKeys()
    static var privateKey = keys.privateKey
    static var publicKey = keys.publicKey
    static let ts = Date().timeIntervalSince1970.description
    static var hash: String {
        let a = "\(ts)\(privateKey)\(publicKey)"
        return a.md5()
    }
    
    static func authParameters() -> [String : String] {
        return ["ts" : MarvelAPIConfig.ts,
                "apikey" : MarvelAPIConfig.publicKey,
                "hash" : MarvelAPIConfig.hash]
    }
}

enum MarvelAPI {
    case characters
    case characterDetail(String)
}

extension MarvelAPI: NetworkConfiguration {
    
    var baseURL: URL { return URL(string: NetworkAPINames.baseURL)! }
    
    var path: String {
        switch self {
        case .characters:
            return "/v1/public/characters"
        case .characterDetail(let id):
            return "/v1/public/characters/\(id)"
        }
    }
    
    var method: String {
        switch self {
        case .characters, .characterDetail:
            return "GET"
        }
    }
    
    var parameters: [String : String] {
        switch self {
        case .characters, .characterDetail:
            return MarvelAPIConfig.authParameters()
        }
    }
    
    public func makeURLRequest() -> URLRequest {
        
        let params = self.parameters
        let pathRequest = "\(self.baseURL)\(path)"
        
        var components = URLComponents(string: pathRequest)!
        components.queryItems = params.map { (key, value) in
            return URLQueryItem(name: key, value: value)
        }
        
        let request = URLRequest(url: components.url!)
        return request
    }
}
