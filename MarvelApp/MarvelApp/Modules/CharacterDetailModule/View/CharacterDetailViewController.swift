//
//  CharacterDetailViewController.swift
//  MarvelApp
//
//  Created by David López Quindos on 3/8/21.
//

import UIKit

class CharacterDetailViewController: BaseViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var characterDescriptionLabel: UILabel!
    let spinner = SpinnerView()
    
    // MARK: - Properties
    
    var presentor: ViewToPresenterCharacterInfoProtocol?
    var character: Character?
    
    lazy var moreInfoViewController: MoreInfoCharacterViewController = {
        return MoreInfoCharacterViewController()
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = character?.name
        configureNavBarBackButton()
        self.characterDescriptionLabel.center.x -= view.bounds.width
        spinner.showSpinnerView(inView: self.view)
        guard let character = self.character, let thumbnailURL = self.character?.thumbnail?.completeURLPath() else { return }
        KFDownloader(url: thumbnailURL, withImageView: self.imgView).startDownload()
        presentor?.startFetchingCharacterInfo(character: character)
    }
    
    // MARK: - Actions
    
    @IBAction func showComicsAction(_ sender: UIButton) {
        self.moreInfoViewController.resource = self.character!.comics
        presentPanModal(self.moreInfoViewController)
    }
    
    @IBAction func showStoriesAction(_ sender: UIButton) {
        self.moreInfoViewController.resource = self.character!.stories
        presentPanModal(self.moreInfoViewController)
    }
}

// MARK: - PresenterToViewCharacterInfoProtocol

extension CharacterDetailViewController: PresenterToViewCharacterInfoProtocol {
    
    func onCharacterInfoResponseSuccess(character: Character) {
        DispatchQueue.main.async {
            self.spinner.removeSpinnerView()
            self.character = character
            self.characterDescriptionLabel.text = character.getDescription()
            self.makeAnimation()
        }
    }
    
    func onCharacterInfoResponseFailed(error: ChallengeError) {
        DispatchQueue.main.async {
            self.spinner.removeSpinnerView()
            let errorDateScreenViewController = UIStoryboard.createErrorScreenViewController
            errorDateScreenViewController.challengeError = error
            self.present(errorDateScreenViewController, animated: true, completion: nil)
        }
    }
    
    private func makeAnimation() {
        UIView.animate(withDuration: 0.5) {
          self.characterDescriptionLabel.center.x += self.view.bounds.width
        }
    }
}
