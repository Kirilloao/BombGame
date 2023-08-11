//
//  CustomButtonCell.swift
//  BombGame
//
//  Created by Kirill Taraturin on 09.08.2023.
//

import UIKit

class CustomButtonCell: UITableViewCell {
    
    // MARK: - UI Properties
    lazy var numberView: UIView = {
        var view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.5838159919, green: 0.2887962759, blue: 0.7136611342, alpha: 1)
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 2
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    lazy var numberLabel: UILabel = {
        var number = UILabel()
        number.textColor = #colorLiteral(red: 1, green: 0.8563113213, blue: 0, alpha: 1)
        number.font = UIFont.boldSystemFont(ofSize: 27)
        number.translatesAutoresizingMaskIntoConstraints = false
        
        return number
    }()
    
    lazy var ruleLabel: UILabel = {
        var rule = UILabel()
        rule.textColor = .greyLabel
        rule.font = UIFont.boldSystemFont(ofSize: 16.7)
        rule.lineBreakMode = .byWordWrapping
        rule.numberOfLines = 0
        rule.translatesAutoresizingMaskIntoConstraints = false
        
        return rule
    }()
    
    lazy var startButton: CustomButton = {
        var button = CustomButton(customTitle: "Старт Игры")
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(numberView)
        contentView.addSubview(ruleLabel)
        contentView.addSubview(startButton)
        
        numberView.addSubview(numberLabel)
        
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Override Methods
    override func layoutSubviews() {
        super.layoutSubviews()
        numberView.layer.cornerRadius = numberView.frame.height / 2
        numberView.clipsToBounds = true
        
        startButton.layer.cornerRadius = startButton.frame.height / 2
    }
    
    // MARK: - Private Methods
    private func setupConstraints() {
        // setup constraints to numberView
        NSLayoutConstraint.activate([
            numberView.topAnchor.constraint(
                equalTo: contentView.topAnchor,
                constant: 5
            ),
            numberView.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor, constant: 20
            ),
            numberView.heightAnchor.constraint(equalToConstant: 33),
            numberView.widthAnchor.constraint(equalToConstant: 33)
        ])
        
        // setup constraints to numberLabel
        NSLayoutConstraint.activate([
            numberLabel.centerXAnchor.constraint(equalTo: numberView.centerXAnchor),
            numberLabel.centerYAnchor.constraint(equalTo: numberView.centerYAnchor)
        ])
        
        // setup constraints to ruleLabel
        NSLayoutConstraint.activate([
            ruleLabel.topAnchor.constraint(
                equalTo: numberView.topAnchor,
                constant: 5
            ),
            ruleLabel.leadingAnchor.constraint(
                equalTo: numberView.trailingAnchor,
                constant: 10
            ),
            ruleLabel.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor,
                constant: -30
            ),
            ruleLabel.bottomAnchor.constraint(
                equalTo: startButton.topAnchor,
                constant: -5
            )
        ])
        
        // setup constraints to startButton
        NSLayoutConstraint.activate([
            startButton.bottomAnchor.constraint(
                equalTo: contentView.bottomAnchor,
                constant: -5
            ),
            startButton.centerXAnchor.constraint(equalTo: ruleLabel.centerXAnchor),
            startButton.widthAnchor.constraint(equalToConstant: 100),
            startButton.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    // MARK: - Public Methods
    func setupViews(_ rule: Rule) {
        numberLabel.text = rule.number
        ruleLabel.text = rule.name
    }
}
