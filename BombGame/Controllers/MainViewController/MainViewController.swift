//
//  MainViewController.swift
//  BombGame
//
//  Created by Александра Савчук on 07.08.2023.
//

import UIKit

class MainViewController: UIViewController {
    
    private lazy var gradientView: GradientView = {
        let gradientView = GradientView(frame: view.bounds)
        gradientView.translatesAutoresizingMaskIntoConstraints = false
        
        return gradientView
    }()
    
    private lazy var bombLabel: UILabel = {
        let label = UILabel()
        label.text = "БОМБА"
        label.textColor = .purpleLabel
        label.font = .boldSystemFont(ofSize: 70)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var bombImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.image = UIImage(named: "bomb")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Игра для компании"
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 40)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let startButton = CustomButton(customTitle: "Старт игры")
    let categoryButton = CustomButton(customTitle: "Категории")
    let rulesButton = CustomRoundButton(systemImageName: "questionmark")
    let settingsButton = CustomRoundButton(systemImageName: "gearshape")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        subviews()
        setupConstraints()
    }
  
    private func subviews() {
        view.addSubview(gradientView)
        view.addSubview(startButton)
        view.addSubview(categoryButton)
        view.addSubview(bombLabel)
        view.addSubview(bombImage)
        view.addSubview(titleLabel)
        view.addSubview(rulesButton)
        view.addSubview(settingsButton)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            gradientView.topAnchor.constraint(equalTo: view.topAnchor),
            gradientView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            gradientView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            gradientView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            startButton.bottomAnchor.constraint(equalTo: categoryButton.topAnchor, constant: -20),
            startButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            categoryButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
            categoryButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
            
            bombLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            bombLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            
            bombImage.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 20),
            bombImage.topAnchor.constraint(equalTo: bombLabel.bottomAnchor, constant: 20),
            bombImage.bottomAnchor.constraint(equalTo: startButton.topAnchor, constant: -20),
            bombImage.widthAnchor.constraint(equalToConstant: 330),
            bombImage.heightAnchor.constraint(equalToConstant: 350),

            rulesButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            rulesButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),

            settingsButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            settingsButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20)
            
        ])
    }

  @objc func startButtonPressed() {
    let gameVC = GameViewController()
    self.navigationController?.pushViewController(gameVC, animated: true)
  }


  @objc func categoryButtonPressed() {
    let gameVC = CategoryViewContoller()
    self.navigationController?.pushViewController(gameVC, animated: true)
  }

  @objc func rulesButtonPressed() {
    let gameVC = RulesViewController()
    self.navigationController?.pushViewController(gameVC, animated: true)

  }

  @objc func settingsButtonPressed() {
    let gameVC = GameEndViewController()
    self.navigationController?.pushViewController(gameVC, animated: true)
  }

  func setup() {
    startButton.addTarget(self, action: #selector(startButtonPressed), for: .touchUpInside)
    categoryButton.addTarget(self, action: #selector(categoryButtonPressed), for: .touchUpInside)
    rulesButton.addTarget(self, action: #selector(rulesButtonPressed), for: .touchUpInside)
    settingsButton.addTarget(self, action: #selector(settingsButtonPressed), for: .touchUpInside)
  }
}
