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
    private lazy var gradientView: GradientView = {
      let gradientView = GradientView(frame: view.bounds)
      gradientView.translatesAutoresizingMaskIntoConstraints = false
      return gradientView
    }()
    
    private lazy var firstLabel: UILabel = {
        let label = UILabel()
        label.text = "Проигравший выполянет задание"
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.numberOfLines = 2
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .center

        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    private lazy var bombImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "bang")
        
        return imageView
    }()
    
    private lazy var secondLabel: UILabel = {
        let secondLabel = UILabel()
        secondLabel.text = "В следующем раунде после каждого ответа хлопать в ладоши"
        secondLabel.textColor = .purpleLabel
        secondLabel.font = UIFont.boldSystemFont(ofSize: 30)
        secondLabel.numberOfLines = 0
        secondLabel.lineBreakMode = .byWordWrapping
        secondLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return secondLabel
    }()
    
    private lazy var anotherTaskButton: UIButton = {
//        let taskButton = UIButton(type: .system)
//        taskButton.setTitle("Другое Задание", for: .normal)
//        taskButton.backgroundColor = .purpleColor
//        taskButton.tintColor = .yellowLabel
//        taskButton.frame = CGRect(x: 0, y: 0, width: 274, height: 79)
//        taskButton.translatesAutoresizingMaskIntoConstraints = false
        let taskButton = createButton()
        
        return taskButton
    }()
    
    private lazy var startOverButton: UIButton = {

        let taskButton = createButton()
        
        return taskButton
    }()
    
    
    
    private var mainStackView = UIStackView()
    
    // MARK: - Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        addView(gradientView,
//                firstLabel,
//                bombImageView,
//                secondLabel,
//                anotherTaskButton,
//                mainStackView
//        )
        addView(gradientView,
            mainStackView)
   
        setupConstraints()
        setupNavigationBar()
        createStackView()
        
        
    }
    
    // MARK: - Private Methods
    
    private func addView(_ view: UIView...) {
        view.forEach { subview in
            self.view.addSubview(subview)
        }
    }

    private func setupConstraints() {
        
      // setup constraints to gradientView
      NSLayoutConstraint.activate([
        gradientView.topAnchor.constraint(equalTo: view.topAnchor),
        gradientView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
        gradientView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        gradientView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
      ])
    }
    
    private func createStackView() {
        mainStackView.axis = .vertical
        mainStackView.spacing = 20
        mainStackView.alignment = .center
        mainStackView.distribution = .fill
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        mainStackView.backgroundColor = .red
        
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            mainStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            mainStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
        
        
        mainStackView.addArrangedSubview(firstLabel)
        mainStackView.addArrangedSubview(bombImageView)
        mainStackView.addArrangedSubview(secondLabel)
        mainStackView.addArrangedSubview(anotherTaskButton)
        mainStackView.addArrangedSubview(startOverButton)
    }
    
    private func createButton() -> UIButton {
        let taskButton = UIButton(type: .system)
        taskButton.setTitle("Другое Задание", for: .normal)
        taskButton.backgroundColor = .purpleLabel
        taskButton.tintColor = .yellow
        taskButton.frame = CGRect(x: 0, y: 0, width: 274, height: 79)
        taskButton.translatesAutoresizingMaskIntoConstraints = false
        
        return taskButton
    }
    

    
    

}

// MARK: - NavigationBar
extension GameEndViewController {
    private func setupNavigationBar() {
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.largeTitleTextAttributes = [.font: UIFont.systemFont(ofSize: 30)]
        
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.purpleLabel]
        navigationController?.navigationBar.standardAppearance = navBarAppearance
        
        title = "Игра"
    }
}
