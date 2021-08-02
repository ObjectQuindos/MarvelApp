//
//  CharactersPresenter.swift
//  MarvelApp
//
//  Created by David López Quindos on 2/8/21.
//

import UIKit

class CharactersPresenter: ViewToPresenterProtocol {
    
    weak var view: PresenterToViewProtocol?
    
    var interactor: PresenterToInteractorProtocol?
    
    var router: PresenterToRouterProtocol?
    
    func startFetchingCharacters() {
        interactor?.fetchCharacters()
    }
    
    func showCharacterDetailViewController(navigation: UINavigationController, character: Character) {
        router?.pushToCharacterDetailScreen(navigation: navigation, character: character)
    }
}

extension CharactersPresenter: InteractorToPresenterProtocol {
    
    func charactersFetchedSuccess(characters: [Character]) {
        view?.showCharacters(characters: characters)
    }
    
    func charactersFetchFailed(error: ChallengeError) {
        view?.showError(error: error)
    }
}
