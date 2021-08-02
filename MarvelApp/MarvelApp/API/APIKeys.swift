//
//  APIKeys.swift
//  MarvelApp
//
//  Created by David López Quindos on 2/8/21.
//

import Foundation

struct KeyDict {
    let publicKey: String
    let privateKey: String
}

class APIKeys {
    
    static func getKeys() -> KeyDict {
        
        if let path = Bundle.main.path(forResource: "apikeys", ofType: "plist") {
            let keys = NSDictionary(contentsOfFile: path)!
            
            return KeyDict(publicKey: (keys[NetworkAPINames.PublicKey] as! String), privateKey: (keys[NetworkAPINames.PrivateKey] as! String))
        }
        return KeyDict(publicKey: "", privateKey: "")
    }
}
