//
//  CharacterInfoRouter.swift
//  MarvelApp
//
//  Created by David López Quindos on 3/8/21.
//

import UIKit

class CharacterInfoRouter: PresenterToRouterCharacterDetailProtocol {
    
    static func createModule() -> CharacterDetailViewController {
        let viewController = UIStoryboard.createCharacterDetailViewController
        
        let presenter: ViewToPresenterCharacterInfoProtocol & InteractorToPresenterCharacterInfoProtocol = CharacterInfoPresenter()
        let interactor: PresenterToInteractorCharacterInfoProtocol = CharacterInfoInteractor()
        let router: PresenterToRouterCharacterDetailProtocol = CharacterInfoRouter()
        
        viewController.presentor = presenter
        presenter.view = viewController
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        
        return viewController
    }
}
