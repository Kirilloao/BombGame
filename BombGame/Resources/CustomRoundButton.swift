//
//  CustomRoundButton.swift
//  BombGame
//
//  Created by Александра Савчук on 07.08.2023.
//

import UIKit

class CustomRoundButton: UIButton {
    var systemImageName: String? {
        didSet {
            setImage(UIImage(systemName: systemImageName ?? ""), for: .normal)
        }
    }
    init(systemImageName: String) {
        super.init(frame: .zero)
        self.systemImageName = systemImageName
        setupButton()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupButton()
    }
    
    private func setupButton() {
        self.layer.cornerRadius = 40
        self.backgroundColor = .purpleColor
        self.tintColor = .yellowLabel
        
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 2)
        self.layer.shadowOpacity = 0.4
        self.layer.shadowRadius = 4
        
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.borderWidth = 1.0
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width * 2 / 3),
            self.heightAnchor.constraint(equalToConstant: 80)
        ])
    }
}
