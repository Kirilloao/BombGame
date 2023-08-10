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
    
    var audioPlayer: AVAudioPlayer?
    var playerViewController: AVPlayerViewController!
    var bombShortImageView: UIImageView!
    var bombLongImageView: UIImageView!
    var timer: Timer?
    
    let questions = ["Назавите города на Б", "Как называется самое глубокое озеро?", "Самая маленькая страна в мире?"]
    
    
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
        addRightNavButton()
        navigationItem.title = "Игра"
        setupGIFs()
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
        print("Play button pressed")
        startGIFLoop()
        textLabel.text = questions[Int.random(in: 0...2)]
        
    }
    
    @objc func pauseButtonPressed() {
    }
    
    func addRightNavButton() {
        let rightBarButton = UIBarButtonItem(image: UIImage(systemName: "pause.circle"), style: .plain, target: self, action: #selector(pauseButtonPressed))
        navigationItem.rightBarButtonItem = rightBarButton
    }
    
    func setup() {
        playButton.addTarget(self, action: #selector(playButtonPressed), for: .touchUpInside)
    }
    
    //MARK: Play GIF
    
    private func setupGIFs() {
        
        guard let bombShortGIF = UIImageView.gifImageWithName(frame: CGRect(x: 0, y: 0, width: 70, height: 70) , resourceName: "bombShort") else {
            fatalError("Failed to load bombShort.gif")
        }
        
        guard let bombLongGIF = UIImageView.gifImageWithName(frame: CGRect(x: 0, y: 0, width: 70, height: 70), resourceName: "bombLong") else {
            fatalError("Failed to load bombLong.gif")
        }
        
        bombShortImageView = bombShortGIF
        bombShortImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(bombShortImageView)
        NSLayoutConstraint.activate([
            bombShortImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            bombShortImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        bombLongImageView = bombLongGIF
        bombLongImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(bombLongImageView)
        NSLayoutConstraint.activate([
            bombLongImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            bombLongImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
        bombLongImageView.isHidden = true
    }
    
    private var isPlayingShortGIF = true
    
    private func startGIFLoop() {
        bombShortImageView.startAnimating()
        timer = Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(switchToLongGIF), userInfo: nil, repeats: false)
    }
    
    @objc private func switchToLongGIF() {
        bombShortImageView.isHidden = true
        bombLongImageView.isHidden = false
        bombLongImageView.startAnimating()
        
        //      timer?.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 0.9, target: self, selector: #selector(stopGIFLoop), userInfo: nil, repeats: false)
    }
    
    @objc private func stopGIFLoop() {
        bombLongImageView.isHidden = true
        bombShortImageView.isHidden = true
        playButton.isEnabled = true
    }
    
    //MARK: Play sound
    
    func playSound() {
        
        if let soundFilePath = Bundle.main.path(forResource: "yourSoundFile", ofType: "mp3") {
            let soundFileURL = URL(fileURLWithPath: soundFilePath)
            
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: soundFileURL)
                audioPlayer?.numberOfLoops = -1 // Значение -1 означает бесконечное зацикливание
                audioPlayer?.prepareToPlay()
            } catch {
                print("Ошибка создания AVAudioPlayer: (error)")
            }
        } else {
            print("Файл звука не найден")
        }
        audioPlayer?.play() ... DispatchQueue.main.asyncAfter(deadline: .now() + 20) {
            self.audioPlayer?.stop()
        }
        
    }
    
    
}

extension UIImageView {
    
    static func gifImageWithName(frame: CGRect, resourceName: String) -> UIImageView? {
        guard let path = Bundle.main.path(forResource: resourceName, ofType: "gif") else {
            print("Gif does not exist at that path")
            return nil
        }
        let url = URL(fileURLWithPath: path)
        guard let gifData = try? Data(contentsOf: url),
              let source =  CGImageSourceCreateWithData(gifData as CFData, nil) else { return nil }
        var images = [UIImage]()
        let imageCount = CGImageSourceGetCount(source)
        for i in 0 ..< imageCount {
            if let image = CGImageSourceCreateImageAtIndex(source, i, nil) {
                images.append(UIImage(cgImage: image))
            }
        }
        let gifImageView = UIImageView(frame: frame)
        gifImageView.animationImages = images
        return gifImageView
    }
}

