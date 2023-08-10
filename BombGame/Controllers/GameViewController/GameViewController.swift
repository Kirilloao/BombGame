//
//  GameViewController.swift
//  BombGame
//
//  Created by Александра Савчук on 07.08.2023.
//

import UIKit
import AVKit
import AVFoundation

class GameViewController: UIViewController, AVAudioPlayerDelegate {
    
    var playerBG: AVAudioPlayer?
    var playerTimer: AVAudioPlayer?
    var bombSoundPlayer: AVAudioPlayer?
    var timer: Timer?
    var mainTimer: Timer?
    var playerViewController: AVPlayerViewController!
    var bombShortImageView: UIImageView!
    var bombLongImageView: UIImageView!
    
    
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
        playerTimer?.delegate = self
        bombSoundPlayer?.delegate = self
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
            
        ])
    }
    
    
    
    //MARK: Buttons
    
    @objc func playButtonPressed() {
        print("Play button pressed")
        playBGSound()
        playTimerSound()
        startGIFLoop()
        playButton.isHidden = true
        textLabel.text = questions[Int.random(in: 0...2)]
        //        startMainTimer()
        
    }
    
    @objc func pauseButtonPressed() {
        print("text")
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
    // пока немного разобрался с работой со звуком, но по гифам пока еще смотрю. По кнопке паузы пока тоже не совсем могу предстваить в голове, как реализовать
    
    private func startGIFLoop() {
        bombShortImageView.startAnimating()
        timer = Timer.scheduledTimer(timeInterval: 29, target: self, selector: #selector(switchToLongGIF), userInfo: nil, repeats: false)
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
    
    //MARK: Common timer
    
    //    private func startMainTimer() {
    //        mainTimer = Timer.scheduledTimer(timeInterval: 30, target: self, selector: #selector(mainTimerFired), userInfo: nil, repeats: true)
    //    }
    //
    //    @objc private func mainTimerFired() {
    //        playBGSound()
    //        startGIFLoop()
    //        playTimerSound()
    //        textLabel.text = questions.randomElement()
    //        playButton.isHidden = true
    //    }
    
    
    
    //MARK: Play sound
    
    func playBGSound() {
        if let soundPath = Bundle.main.url(forResource: "fon1", withExtension: "mp3") {
            do {
                playerBG = try AVAudioPlayer(contentsOf: soundPath)
                playerBG?.numberOfLoops = -1
                playerBG?.volume = 0.5
                playerBG?.prepareToPlay()
            } catch {
                print("Ошибка создания цикла \(error)")
            }
        }
        playerBG!.play()
        DispatchQueue.main.asyncAfter(deadline: .now() + 30) {
            self.playerBG!.stop()
        }
    }
    
    
    func playTimerSound() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 20) { [weak self] in
            if let soundPath = Bundle.main.url(forResource: "timer1", withExtension: "mp3") {
                do {
                    self?.playerTimer = try AVAudioPlayer(contentsOf: soundPath)
                    self?.playerTimer?.numberOfLoops = -1
                    self?.playerTimer?.prepareToPlay()
//                    self?.playerTimer?.delegate = self
                    
                    self?.playerTimer?.play()
                    DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
                        self?.playerTimer?.stop()
                        self!.playBombSound() //
                    }
                } catch {
                    print("Ошибка создания цикла \(error)")
                }
            }
        }
    }
    
    
    
    func playBombSound() {
        if let additionalSoundPath = Bundle.main.url(forResource: "vzriyiv1", withExtension: "mp3") {
            do {
                bombSoundPlayer = try AVAudioPlayer(contentsOf: additionalSoundPath)
                bombSoundPlayer?.prepareToPlay()
                bombSoundPlayer?.play()
            } catch {
                print("Ошибка создания дополнительного звука \(error)")
            }
        }
    }
    
}

//MARK: Extension for UIImageView
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

