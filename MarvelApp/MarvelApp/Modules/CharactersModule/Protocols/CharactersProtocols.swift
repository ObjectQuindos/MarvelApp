//
//  CharactersProtocols.swift
//  MarvelApp
//
//  Created by David López Quindos on 2/8/21.
//

import UIKit

protocol ViewToPresenterProtocol: class {
    
    var view: PresenterToViewProtocol? { get set }
    var interactor: PresenterToInteractorProtocol? { get set }
    var router: PresenterToRouterProtocol? { get set }
    func startFetchingCharacters()
    func showCharacterDetailViewController(navigation: UINavigationController, character: Character)
}

protocol PresenterToViewProtocol: class {
    func showCharacters(characters: [Character])
    func showError(error: ChallengeError)
}

protocol PresenterToRouterProtocol: class {
    static func createModule() -> UIViewController
    func pushToCharacterDetailScreen(navigation: UINavigationController, character: Character)
}

protocol PresenterToInteractorProtocol: class {
    var presenter: InteractorToPresenterProtocol? { get set }
    func fetchCharacters()
}

protocol InteractorToPresenterProtocol: class {
    func charactersFetchedSuccess(characters: [Character])
    func charactersFetchFailed(error: ChallengeError)
}
