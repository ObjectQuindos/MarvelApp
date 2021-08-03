//
//  CharactersInteractor.swift
//  MarvelApp
//
//  Created by David López Quindos on 2/8/21.
//

import Foundation

class CharactersInteractor: PresenterToInteractorProtocol {
    var presenter: InteractorToPresenterProtocol?
    
    func fetchCharacters() {
        var charactersArray: [Character] = []
        
        ServiceRequests().fetchCharacters { (returnData) in
            
            if returnData.code != 200 {
                self.presenter?.charactersFetchFailed(error: returnData.error!)
            } else {
                
                let decoder = JSONDecoder()
                let data = Data(returnData.value.toJSONString().utf8)
                do {
                    charactersArray = try decoder.decode([Character].self, from: data)
                    self.presenter?.charactersFetchedSuccess(characters: charactersArray)
                } catch let error {
                    print("Failed to decode JSON: \(error)")
                }
            }
        }
    }
}
