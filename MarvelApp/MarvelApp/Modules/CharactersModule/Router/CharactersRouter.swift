//
//  CharactersRouter.swift
//  MarvelApp
//
//  Created by David López Quindos on 2/8/21.
//

import UIKit

class CharactersRouter: PresenterToRouterProtocol {
    
    static func createModule() -> UIViewController {
        let viewController = UIStoryboard.createCharactersViewController
        
        let presenter: ViewToPresenterProtocol & InteractorToPresenterProtocol = CharactersPresenter()
        let interactor: PresenterToInteractorProtocol = CharactersInteractor()
        let router: PresenterToRouterProtocol = CharactersRouter()
        
        viewController.presentor = presenter
        presenter.view = viewController
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        
        let navigation = UINavigationController(rootViewController: viewController)
        
        return navigation
    }
    
    func pushToCharacterDetailScreen(navigation: UINavigationController, character: Character) {
        
    }
}
