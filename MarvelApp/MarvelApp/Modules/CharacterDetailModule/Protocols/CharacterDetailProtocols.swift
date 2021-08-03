//
//  CharacterDetailProtocols.swift
//  MarvelApp
//
//  Created by David López Quindos on 3/8/21.
//

import Foundation

protocol ViewToPresenterCharacterInfoProtocol: class {
    
    var view: PresenterToViewCharacterInfoProtocol? { get set }
    var interactor: PresenterToInteractorCharacterInfoProtocol? { get set }
    var router: PresenterToRouterCharacterDetailProtocol? { get set }
    func startFetchingCharacterInfo(character: Character)
}

protocol PresenterToViewCharacterInfoProtocol: class {
    func onCharacterInfoResponseSuccess(character: Character)
    func onCharacterInfoResponseFailed(error: ChallengeError)
}

protocol PresenterToRouterCharacterDetailProtocol: class {
    static func createModule() -> CharacterDetailViewController
}

protocol PresenterToInteractorCharacterInfoProtocol: class {
    var presenter: InteractorToPresenterCharacterInfoProtocol? { get set }
    func fetchCharacterInfo(character: Character)
}

protocol InteractorToPresenterCharacterInfoProtocol: class {
    func characterFetchSuccess(character: Character)
    func characterFetchFailed(error: ChallengeError)
}
