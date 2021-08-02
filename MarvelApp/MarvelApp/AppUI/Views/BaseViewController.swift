//
//  BaseViewController.swift
//  MarvelApp
//
//  Created by David López Quindos on 2/8/21.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationStyle()
    }
    
    private func configureNavigationStyle() {
        navigationController?.navigationBar.barTintColor = UIColor(red: 0.82, green: 0.94, blue: 0.75, alpha: 1.00)
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.black, NSAttributedString.Key.font : UIFont(name: "HelveticaNeue-Light", size: 20.0)!]
    }
    
    internal func configureNavBarBackButton() {
        var image: UIImage!
        if #available(iOS 13.0, *) {
            image = UIImage(systemName: "chevron.left")!.withRenderingMode(.alwaysOriginal)
        } else {
            image = UIImage(named: "back")!.withRenderingMode(.alwaysOriginal)
        }
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(goBack))
    }
    
    @objc func goBack() {
        navigationController?.popViewController(animated: true)
    }
}
