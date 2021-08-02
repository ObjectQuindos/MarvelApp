//
//  RootRouter.swift
//  MarvelApp
//
//  Created by David López Quindos on 2/8/21.
//

import UIKit

class RootRouter: RootRouterProtocol {
    
    func presentRootScreen(in window: UIWindow) {
        window.makeKeyAndVisible()
        window.rootViewController = UIViewController()
    }
}
