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

    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(circleView)
        
        contentView.backgroundColor = .clear
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Override Methods
    override func layoutSubviews() {
        super.layoutSubviews()
        circleView.layer.cornerRadius = circleView.frame.height / 2
        circleView.clipsToBounds = true
    }
    
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
    }
    
}
