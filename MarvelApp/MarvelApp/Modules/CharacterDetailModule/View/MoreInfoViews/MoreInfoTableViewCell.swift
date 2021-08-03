//
//  MoreInfoTableViewCell.swift
//  MarvelApp
//
//  Created by David López Quindos on 3/8/21.
//

import UIKit

class MoreInfoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func setCell(resource: Resource) {
        self.nameLabel?.text = resource.name
    }
}
