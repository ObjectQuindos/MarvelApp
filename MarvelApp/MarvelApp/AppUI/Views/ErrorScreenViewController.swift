//
//  ErrorScreenViewController.swift
//  MarvelApp
//
//  Created by David López Quindos on 2/8/21.
//

import UIKit

class ErrorScreenViewController: UIViewController {
    
    @IBOutlet weak var imgError: UIImageView!
    @IBOutlet weak var messageError: UILabel!
    
    var challengeError: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.messageError?.text = challengeError
    }
}
