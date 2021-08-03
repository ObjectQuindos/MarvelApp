//
//  CharacterInfoPresenter.swift
//  MarvelApp
//
//  Created by David López Quindos on 3/8/21.
//

import Foundation

class CharacterInfoPresenter: ViewToPresenterCharacterInfoProtocol {
    
    weak var view: PresenterToViewCharacterInfoProtocol?
    
    var interactor: PresenterToInteractorCharacterInfoProtocol?
    
    var router: PresenterToRouterCharacterDetailProtocol?
    
    func startFetchingCharacterInfo(character: Character) {
        interactor?.fetchCharacterInfo(character: character)
    }
}

extension CharacterInfoPresenter: InteractorToPresenterCharacterInfoProtocol {
    
    func characterFetchSuccess(character: Character) {
        view?.onCharacterInfoResponseSuccess(character: character)
    }
    
    func characterFetchFailed(error: ChallengeError) {
        view?.onCharacterInfoResponseFailed(error: error)
    }
}
