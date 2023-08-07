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

  let myButton = CustomButton(customTitle: "Старт игры")

  override func viewDidLoad() {
    super.viewDidLoad()

    subviews()
    setupConstraints()

  }

  private func subviews() {
    view.addSubview(gradientView)
    view.addSubview(myButton)
  }

  func setupConstraints() {
    NSLayoutConstraint.activate([
      gradientView.topAnchor.constraint(equalTo: view.topAnchor),
      gradientView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      gradientView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      gradientView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

      myButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
      myButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
      ])
  }
}
