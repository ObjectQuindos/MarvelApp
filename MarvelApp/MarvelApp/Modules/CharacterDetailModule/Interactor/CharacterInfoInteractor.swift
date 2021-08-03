//
//  CharacterInfoInteractor.swift
//  MarvelApp
//
//  Created by David López Quindos on 3/8/21.
//

import Foundation

class CharacterInfoInteractor: PresenterToInteractorCharacterInfoProtocol {
    var presenter: InteractorToPresenterCharacterInfoProtocol?
    
    func fetchCharacterInfo(character: Character) {
        ServiceRequests().fetchCharacterInfo(characterId: character.id) { (returnData) in
            
            if returnData.code != 200 {
                self.presenter?.characterFetchFailed(error: returnData.error!)
            } else {
                if let characterData = returnData.value.first {
                    var char = character
                    char.updateInfo(json: characterData)
                    self.presenter?.characterFetchSuccess(character: char)
                }
            }
        }
    }
}
