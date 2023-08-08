//
//  GameEndViewController.swift
//  BombGame
//
//  Created by Александра Савчук on 07.08.2023.
//

import Foundation
import UIKit

class GameEndViewController: UIViewController {
    
    // MARK: - UI properties
    private var mainStackView = UIStackView()
    
    private lazy var gradientView: GradientView = {
        let gradientView = GradientView(frame: view.bounds)
        gradientView.translatesAutoresizingMaskIntoConstraints = false
        return gradientView
    }()
    
    private lazy var taskLabel: UILabel = {
        let label = createLabel(
            with: "Проигравший выполянет задание",
            textColor: .black,
            font: UIFont.boldSystemFont(ofSize: 25),
            lines: 2
        )
        
        return label
    }()
    
    private lazy var bombImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "bang")
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    private lazy var descriptionTaskLabel: UILabel = {
        let secondLabel = createLabel(
            with: "В следующем раунде после каждого ответа хлопать в ладоши",
            textColor: .purpleLabel,
            font: UIFont.boldSystemFont(ofSize: 20),
            lines: 0
        )
        
        return secondLabel
    }()
    
    private lazy var anotherTaskButton: CustomButton = {
        let taskButton = CustomButton(customTitle: "Другое Задание")
        
        return taskButton
    }()
    
    private lazy var startOverButton: CustomButton = {
        let taskButton = CustomButton(customTitle: "Начать Заново")
        
        return taskButton
    }()
    
    
    
    // MARK: - Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSubviews()
        
        setupConstraints()
        setupNavigationBar()
        createStackView()
    }
    
    // MARK: - Private Methods
    private func addSubviews() {
        view.addSubview(gradientView)
        view.addSubview(mainStackView)
    }
    
    private func setupConstraints() {
        
        // setup constraints to gradientView
        NSLayoutConstraint.activate([
            gradientView.topAnchor.constraint(equalTo: view.topAnchor),
            gradientView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            gradientView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            gradientView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        // setup constraints to firstLabel
        NSLayoutConstraint.activate([
            taskLabel.heightAnchor.constraint(equalToConstant: 80)
        ])
        
        // setup constraints to secondLabel
        NSLayoutConstraint.activate([
            descriptionTaskLabel.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func createStackView() {
        
        mainStackView.axis = .vertical
        mainStackView.spacing = 20
        mainStackView.alignment = .center
        mainStackView.distribution = .fill
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor
            ),
            mainStackView.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: 16
            ),
            mainStackView.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: -16
            ),
            mainStackView.bottomAnchor.constraint(
                equalTo: view.bottomAnchor,
                constant: -30
            ),
        ])
        
        mainStackView.addArrangedSubview(taskLabel)
        mainStackView.addArrangedSubview(bombImageView)
        mainStackView.addArrangedSubview(descriptionTaskLabel)
        mainStackView.addArrangedSubview(anotherTaskButton)
        mainStackView.addArrangedSubview(startOverButton)
    }
    
    private func createLabel(with text: String, textColor: UIColor, font: UIFont, lines: Int) -> UILabel {
        
        let label = UILabel()
        label.text = text
        label.textColor = textColor
        label.font = font
        label.numberOfLines = lines
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .center
        
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }
}

// MARK: - NavigationBar
extension GameEndViewController {
    private func setupNavigationBar() {
        let navBarAppearance = UINavigationBarAppearance()
        
        navBarAppearance.titleTextAttributes = [
            .foregroundColor: UIColor.purpleLabel
        ]
        navigationController?.navigationBar.standardAppearance = navBarAppearance
        
        title = "Игра"
    }
}
