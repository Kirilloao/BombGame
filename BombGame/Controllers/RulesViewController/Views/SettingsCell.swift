//
//  SettingsCell.swift
//  BombGame
//
//  Created by Kirill Taraturin on 11.08.2023.
//

import UIKit

class SettingsCell: UITableViewCell {
    
    lazy var circleView: UIView = {
        var circle = UIView()
        circle.backgroundColor = .purpleColor
        circle.layer.borderColor = UIColor.black.cgColor
        circle.layer.borderWidth = 1
        circle.translatesAutoresizingMaskIntoConstraints = false
        
        return circle
        
    }()
    
    lazy var mainLabel: UILabel = {
        var mainLabel = UILabel()
        mainLabel.text = "В настройках игры можно задать время взрыва бомбы:"
         
        mainLabel.textColor = .greyLabel
        mainLabel.font = UIFont.boldSystemFont(ofSize: 16.7)
        mainLabel.lineBreakMode = .byWordWrapping
        mainLabel.numberOfLines = 0
        mainLabel.translatesAutoresizingMaskIntoConstraints = false
        mainLabel.textAlignment = .center
        
        return mainLabel
        
    }()

    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(circleView)
        contentView.addSubview(mainLabel)
        
        contentView.backgroundColor = .clear
        setupConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Override Methods
    override func layoutSubviews() {
        super.layoutSubviews()
        circleView.layer.cornerRadius = 4.5
    }
    
    // MARK: - Private Methods
    private func setupConstraints() {
        // setup constraints to circleView
        NSLayoutConstraint.activate([
            circleView.topAnchor.constraint(
                equalTo: contentView.topAnchor,
                constant: 5
            ),
            circleView.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor, constant: 10
            ),
            circleView.heightAnchor.constraint(equalToConstant: 9),
            circleView.widthAnchor.constraint(equalToConstant: 9)
        ])
        
        // setup constraints to mainLabel
        // setup constraints to ruleLabel
        NSLayoutConstraint.activate([
            mainLabel.topAnchor.constraint(
                equalTo: contentView.topAnchor,
                constant: 0
            ),
            mainLabel.leadingAnchor.constraint(
                equalTo: circleView.trailingAnchor,
                constant: 10
            ),
            mainLabel.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor,
                constant: -20
            ),
//            mainLabel.heightAnchor.constraint(equalToConstant: 40)
            mainLabel.bottomAnchor.constraint(
                equalTo: contentView.bottomAnchor,
                constant: -5
            )
        ])
    }
    
    func setupMainLabel(_ text: String) {
        mainLabel.text = text
    }
    
}
