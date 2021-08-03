//
//  ViewController.swift
//  MarvelApp
//
//  Created by David López Quindos on 2/8/21.
//

import UIKit

class CharactersViewController: BaseViewController {
    
    @IBOutlet weak var tableView: UITableView!
    let spinner = SpinnerView()
    
    var presentor: ViewToPresenterProtocol?
    var characters: [Character] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Personajes Marvel"
        tableView.separatorStyle = .none
        spinner.showSpinnerView(inView: self.view)
        presentor?.startFetchingCharacters()
    }
}

// MARK: - UITableViewDataSource & UITableViewDelegate

extension CharactersViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.characters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UINames.PreviewCharacterTableViewCell, for: indexPath) as! PreviewCharacterTableViewCell
        cell.setCell(characterInfo: self.characters[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let character = self.characters[indexPath.row]
        presentor?.showCharacterDetailViewController(navigation: navigationController!, character: character)
    }
}

// MARK: - PresenterToViewProtocol

extension CharactersViewController: PresenterToViewProtocol {
    
    func showCharacters(characters: [Character]) {
        self.characters = characters
        self.updateUIsuccessResponse()
    }
    
    func showError(error: ChallengeError) {
        self.updateUIfailedResponse(error: error)
    }
    
    // MARK: - Private functions UI
    
    private func updateUIsuccessResponse() {
        DispatchQueue.main.async {
            self.spinner.removeSpinnerView()
            self.tableView.separatorStyle = .singleLine
            self.tableView.reloadData()
        }
    }
    
    private func updateUIfailedResponse(error: ChallengeError) {
        DispatchQueue.main.async {
            self.spinner.removeSpinnerView()
            let errorDateScreenViewController = UIStoryboard.createErrorScreenViewController
            errorDateScreenViewController.challengeError = error
            self.present(errorDateScreenViewController, animated: true, completion: nil)
        }
    }
}
