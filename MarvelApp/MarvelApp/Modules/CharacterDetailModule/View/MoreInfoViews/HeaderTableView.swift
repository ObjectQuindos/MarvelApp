//
//  HeaderTableView.swift
//  MarvelApp
//
//  Created by David López Quindos on 3/8/21.
//

import UIKit

class HeaderTableView: UIView {
    
    struct Constants {
        static let contentInsets = UIEdgeInsets(top: 12.0, left: 16.0, bottom: 12.0, right: 16.0)
    }
    
    // MARK: - Views
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Lato-Bold", size: 17.0)
        return label
    }()
    
    let subtitleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.textColor = UIColor.blue
        label.font = UIFont(name: "Lato-Regular", size: 13.0)
        return label
    }()
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [titleLabel, subtitleLabel])
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 4.0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor(red: 0.82, green: 0.94, blue: 0.75, alpha: 1.00)
        addSubview(stackView)
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Layout
    
    func setupConstraints() {
        
        stackView.topAnchor.constraint(equalTo: topAnchor, constant: Constants.contentInsets.top).isActive = true
        stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.contentInsets.left).isActive = true
        stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Constants.contentInsets.right).isActive = true
        stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -Constants.contentInsets.bottom).isActive = true
    }
    
    // MARK: - View Configuration
    
    func configure(resources: [Resource]) {
        let text = ((resources.first as? Comic) != nil) ? "Comics" : "Stories"
        titleLabel.text = text
        subtitleLabel.text = "Número de \(text): \(resources.count)"
    }
}
