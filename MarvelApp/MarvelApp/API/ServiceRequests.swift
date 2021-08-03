//
//  ServiceRequests.swift
//  MarvelApp
//
//  Created by David López Quindos on 2/8/21.
//

import Foundation

class ServiceRequests {
    
    public func fetchCharacters(completionHandler: @escaping (_ dataResponse: APIReturnDataSet) -> Void) {
        let urlRequest = MarvelAPI.characters.makeURLRequest()
        
        let task = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            
            if data != nil {
                let returnData = self.apiReturnSerialization(fromData: data!, response: response)
                completionHandler(returnData)
            }
            if error != nil {
                let returnData = APIReturnDataSet(error: error!, response: response)
                completionHandler(returnData)
            }
        }
        task.resume()
    }
    
    public func fetchCharacterInfo(characterId: Int, completionHandler: @escaping (_ dataResponse: APIReturnDataSet) -> Void) {
        let idString = String(characterId)
        let urlRequest = MarvelAPI.characterDetail(idString).makeURLRequest()
        
        let task = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            
            if data != nil {
                let returnData = self.apiReturnSerialization(fromData: data!, response: response)
                completionHandler(returnData)
            }
            if error != nil {
                let returnData = APIReturnDataSet(error: error!, response: response)
                completionHandler(returnData)
            }
        }
        task.resume()
    }
    
    private func apiReturnSerialization(fromData data: Data, response: URLResponse?) -> APIReturnDataSet {
        do {
            if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String : Any] {
                let allData = APIReturnDataSet(fromJson: json, response: response)
                return allData
            }
            return APIReturnDataSet(error: ChallengeError.genericError(message: "Error en la serialización"), response: nil)
        } catch let error {
            print("Error: \(error.localizedDescription)")
            return APIReturnDataSet(error: error, response: nil)
        }
    }
}
