//
//  BombTimeCell.swift
//  BombGame
//
//  Created by Kirill Taraturin on 11.08.2023.
//

import UIKit

class BombTimeCell: UITableViewCell {
    
    // MARK: - Buttons
    private lazy var shortButton: CustomButton = {
        var shortButton = createButton(with: "Короткое")
        
        return shortButton as! CustomButton
    }()
    
    private lazy var middleButton: CustomButton = {
        var shortButton = createButton(with: "Среднее")
        
        return shortButton as! CustomButton
    }()
    
    private lazy var longButton: CustomButton = {
        var shortButton = createButton(with: "Длинное")
        
        return shortButton as! CustomButton
    }()
    
    private lazy var randomButton: CustomButton = {
        var shortButton = createButton(with: "Cлучайное")
        
        return shortButton as! CustomButton
    }()
    
    // MARK: - Labels
    private lazy var shortLabel: UILabel = {
        var shortLabel = createLabel(with: "Бомба взорвется в течении 10 секунд.")
        
        return shortLabel
    }()
    
    private lazy var middleLabel: UILabel = {
        var shortLabel = createLabel(with: "Бомба взорвется в течении 20 секунд.")
        
        return shortLabel
    }()
    
    private lazy var longLabel: UILabel = {
        var shortLabel = createLabel(with: "Бомба взорвется в течении 45 секунд.")
        
        return shortLabel
    }()
    
    private lazy var randomLabel: UILabel = {
        var shortLabel = createLabel(with: "Бомба взорвется в течении 10-45 секунд.")
        
        return shortLabel
    }()
    
    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubviews()
        
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    private func addSubviews() {
        contentView.addSubview(shortButton)
        contentView.addSubview(shortLabel)
        contentView.addSubview(middleButton)
        contentView.addSubview(middleLabel)
        contentView.addSubview(longButton)
        contentView.addSubview(longLabel)
        contentView.addSubview(randomButton)
        contentView.addSubview(randomLabel)
    }
    
    private func setupConstraints() {
        
        // setup constraints to shortButton
        NSLayoutConstraint.activate([
            shortButton.topAnchor.constraint(
                equalTo: contentView.topAnchor,
                constant: 20
            ),
            shortButton.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor,
                constant: 10
            ),
            shortButton.heightAnchor.constraint(equalToConstant: 35),
            shortButton.widthAnchor.constraint(equalToConstant: 120)
        ])
        
        // setup constraints to shortLabel
        NSLayoutConstraint.activate([
            shortLabel.topAnchor.constraint(
                equalTo: contentView.topAnchor
                , constant: 20
            ),
            shortLabel.leadingAnchor.constraint(
                equalTo: shortButton.trailingAnchor,
                constant: 5
            ),
            shortLabel.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor,
                constant: 0
            ),
            shortLabel.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        // setup constraints to middleButton
        setupConstraintsToButton(middleButton, topAnchor: shortButton)
        
        // setup constraints to middleLabel
        setupContraintsToLabel(
            middleLabel,
            topAnchor: shortLabel,
            leadingAnchor: middleButton
        )
        
        // setup constraints to longButton
        setupConstraintsToButton(longButton, topAnchor: middleButton)
        
        // setup constraints to longLabel
        setupContraintsToLabel(
            longLabel,
            topAnchor: middleLabel,
            leadingAnchor: longButton
        )
        
        // setup constraints to randomButton
        setupConstraintsToButton(randomButton, topAnchor: longButton)
        
        // setup constraints to randomLabel
        NSLayoutConstraint.activate([
            randomLabel.topAnchor.constraint(
                equalTo: longButton.bottomAnchor,
                constant: 20
            ),
            randomLabel.leadingAnchor.constraint(
                equalTo: randomButton.trailingAnchor,
                constant: 5
            ),
            randomLabel.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor,
                constant: 0
            ),
            randomLabel.bottomAnchor.constraint(
                equalTo: contentView.bottomAnchor,
                constant: -10
            )
        ])
    }
    
    private func setupConstraintsToButton(_ button: UIButton, topAnchor: UIButton) {
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(
                equalTo: topAnchor.bottomAnchor,
                constant: 25
            ),
            button.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor,
                constant: 10
            ),
            button.heightAnchor.constraint(equalToConstant: 35),
            button.widthAnchor.constraint(equalToConstant: 120)
        ])
    }
    
    private func setupContraintsToLabel(_ label: UILabel, topAnchor: UIView, leadingAnchor: UIView) {
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(
                equalTo: topAnchor.bottomAnchor,
                constant: 20
            ),
            label.leadingAnchor.constraint(
                equalTo: leadingAnchor.trailingAnchor,
                constant: 5
            ),
            label.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor,
                constant: 0
            ),
            label.heightAnchor.constraint(equalToConstant: 40)
        ])
        
    }
    
    private func createButton(with title: String) -> UIButton {
        let shortButton = CustomButton(customTitle: title)
        
        shortButton.translatesAutoresizingMaskIntoConstraints = false
        shortButton.layer.cornerRadius = 17.5
        shortButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        
        return shortButton
    }
    
    private func createLabel(with text: String) -> UILabel {
        let shortLabel = UILabel()
        shortLabel.text = text
        
        shortLabel.textColor = .greyLabel
        shortLabel.font = UIFont.boldSystemFont(ofSize: 16.7)
        shortLabel.lineBreakMode = .byWordWrapping
        shortLabel.numberOfLines = 0
        shortLabel.translatesAutoresizingMaskIntoConstraints = false
        shortLabel.textAlignment = .center
        
        return shortLabel
    }
}
