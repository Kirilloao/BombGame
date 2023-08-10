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
    
    var player: AVAudioPlayer?
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
        navigationItem.title = "Игра"
        addRightNavButton()
        setup()
        subviews()
        setupConstraints()
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
            playButton.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width * 2 / 3),
            playButton.heightAnchor.constraint(equalToConstant: 80),
            
        ])
    }
    
    
    
    //MARK: Buttons
    
    @objc func playButtonPressed() {
        print("Play button pressed")
        playBGSound()
        startGIFLoop()
        playTimerSound()
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
  
    //MARK: Play video
    
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
    // пока немного разобрался с работой со звуком, но по гифам пока еще смотрю. По кнопке паузы пока тоже не совсем могу предстваить в голове, как реализовать
    
    private func startGIFLoop() {
        bombShortImageView.startAnimating()
        timer = Timer.scheduledTimer(timeInterval: 29.1, target: self, selector: #selector(switchToLongGIF), userInfo: nil, repeats: false)
        // Идет не состыковка гифа и звука немного
    }
    
    @objc private func switchToLongGIF() {
        bombShortImageView.isHidden = true
        bombLongImageView.isHidden = false
        bombLongImageView.startAnimating()
        
        //      timer?.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 0.9, target: self, selector: #selector(stopGIFLoop), userInfo: nil, repeats: false)
        // Идет не состыковка гифа и звука немного
    }
    
    @objc private func stopGIFLoop() {
        bombLongImageView.isHidden = true
        bombShortImageView.isHidden = true
        playButton.isEnabled = true
    }
    
    //MARK: Play sound
    // Мы делаем отдельно отдельно функцию для звука взрыва или можем присоединить к концу звука таймера звук взрыва?
    func playBGSound() {
        if let soundPath = Bundle.main.url(forResource: "fon1", withExtension: "mp3") {
            do {
                player = try AVAudioPlayer(contentsOf: soundPath)
                player?.numberOfLoops = -1
                player?.volume = 0.5
                player?.prepareToPlay()
            } catch {
                print("Ошибка создания цикла \(error)")
            }
            
        }
        
        player!.play()
        DispatchQueue.main.asyncAfter(deadline: .now() + 30) {
            self.player!.stop()
        }
        
    }
    
    func playTimerSound() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 20) { [weak self] in
            if let soundPath = Bundle.main.url(forResource: "timer1", withExtension: "mp3") {
                do {
                    self?.player = try AVAudioPlayer(contentsOf: soundPath)
                    self?.player?.numberOfLoops = -1
                    self?.player?.prepareToPlay()
                    self?.player?.play()
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 30) {
                        self?.player?.stop()
                    }
                } catch {
                    print("Ошибка создания цикла \(error)")
                }
            }
        }
    }
    
    //    // Создайте плеер
    //    player = AVPlayer(url: videoPath)
    //    var player = AVPlayer(url: videoURL)
    //
    //    // Создайте плеер контроллер и присвойте плеер
    //    var playerViewController = AVPlayerViewController()
    //    playerViewController.player = player
    //
    
    
    
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

