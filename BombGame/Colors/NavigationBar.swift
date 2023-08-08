//
//  NavigationBar.swift
//  BombGame
//
//  Created by Александра Савчук on 08.08.2023.
//

import Foundation
import UIKit

extension UIViewController {
    func setupNavigationBar(title: String) {
        let backButton = UIBarButtonItem(image: UIImage(systemName: "chevron.left"), style: .plain, target: self, action: #selector(goBack))
        backButton.tintColor = .blackBackButton
        navigationItem.leftBarButtonItem = backButton
        navigationItem.title = title

        navigationController?.navigationBar.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.purpleLabel,
            NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 30)
        ]
    }

    @objc private func goBack() {
        navigationController?.popViewController(animated: true)
    }
}

