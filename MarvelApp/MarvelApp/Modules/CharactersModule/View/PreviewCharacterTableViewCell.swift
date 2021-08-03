//
//  PreviewCharacterTableViewCell.swift
//  MarvelApp
//
//  Created by David López Quindos on 3/8/21.
//

import UIKit

class PreviewCharacterTableViewCell: UITableViewCell {
    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var nameCharacterLabel: UILabel! {
        didSet { nameCharacterLabel.accessibilityLabel = UITests.characterNameIdentifier }
    }
    @IBOutlet weak var modifiedDateLabel: UILabel! {
        didSet { modifiedDateLabel.accessibilityLabel = UITests.dateModifiedIdentifier }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func setCell(characterInfo character: Character) {
        self.nameCharacterLabel.text = character.name
        self.modifiedDateLabel.text = "Última actualización: \(character.modifiedDate.setFormatStyle())"
        
        if let urlThumbnail = character.thumbnail?.completeURLPath() {
            let kfDownloader = KFDownloader(url: urlThumbnail, withImageView: self.thumbnailImageView)
            kfDownloader.startDownload()
        }
    }
}
