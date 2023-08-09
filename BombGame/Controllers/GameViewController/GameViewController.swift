//
//  GameViewController.swift
//  BombGame
//
//  Created by Александра Савчук on 07.08.2023.
//

import UIKit
import AVKit
import AVFoundation

class GameViewController: UIViewController {
    
    var player: AVPlayer?
    var playerViewController: AVPlayerViewController!
    
    
    private lazy var gradientView: GradientView = {
        let gradientView = GradientView(frame: view.bounds)
        gradientView.translatesAutoresizingMaskIntoConstraints = false
        return gradientView
    }()
    
    
    let textLabel: UILabel = {
        let textLabel = UILabel()
        textLabel.text = "Нажмите “Запустить” чтобы начать игру"
        textLabel.frame = CGRect(x: 24, y: 127, width: 329, height: 200)
        textLabel.numberOfLines = 0
        textLabel.lineBreakMode = .byWordWrapping
        textLabel.textColor = .purpleLabel
        textLabel.textAlignment = .center
        textLabel.font = UIFont.boldSystemFont(ofSize: 35)
        return textLabel
    } ()
    
    let playButton = CustomButton(customTitle: "Запустить")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        subviews()
        setupConstraints()
        navigationItem.title = "Игра"
    }
    
    
    private func subviews() {
        view.addSubview(gradientView)
        view.addSubview(textLabel)
        view.addSubview(playButton)
    }
    func setupConstraints() {
        NSLayoutConstraint.activate([
            gradientView.topAnchor.constraint(equalTo: view.topAnchor),
            gradientView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            gradientView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            gradientView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            playButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            playButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -64),
            
        ])
    }
    
    
    
    //MARK: Buttons
    
    @objc func playButtonPressed() {
        
    }
    
    func setup() {
        playButton.addTarget(self, action: #selector(playButtonPressed), for: .touchUpInside)
    }
    
    
    //MARK: Play video
    
    
    let videoPath = Bundle.main.path(forResource: "bomb_animation", ofType: "mp4")
    
//    // Создайте плеер
//    player = AVPlayer(url: videoPath)
//    var player = AVPlayer(url: videoURL)
//
//    // Создайте плеер контроллер и присвойте плеер
//    var playerViewController = AVPlayerViewController()
//    playerViewController.player = player
//


    
}
