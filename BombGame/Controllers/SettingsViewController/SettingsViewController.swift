//
//  SettingsViewController.swift
//  BombGame
//
//  Created by Александра Савчук on 07.08.2023.
//

import UIKit

class SettingsViewController: UIViewController {
    
    private lazy var gradientView: GradientView = {
        let gradientView = GradientView(frame: view.bounds)
        gradientView.translatesAutoresizingMaskIntoConstraints = false
        
        return gradientView
    }()
    
    private lazy var musicPickerView: MusicPickerView = {
        let picker = MusicPickerView()
        picker.isHidden = true
        return picker
    }()
    
    private lazy var selectedMusicLabel: UILabel = {
        let label = UILabel()
        label.text = K.arrayFon[0]
        label.textColor = .purpleLabel
        label.font = .boldSystemFont(ofSize: 20)
        label.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(selectedMusicLabelTapped))
        label.addGestureRecognizer(tapGesture)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var tickPickerView: TickPickerView = {
        let picker = TickPickerView()
        picker.isHidden = true
        return picker
    }()
    
    private lazy var selectedTickLabel: UILabel = {
        let label = UILabel()
        label.text = K.arrayTick[0]
        label.textColor = .purpleLabel
        label.font = .boldSystemFont(ofSize: 20)
        label.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(selectedTickLabelTapped))
        label.addGestureRecognizer(tapGesture)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var explosionPickerView: ExplosionPickerView = {
        let picker = ExplosionPickerView()
        picker.isHidden = true
        return picker
    }()
    
    private lazy var selectedExplosionLabel: UILabel = {
        let label = UILabel()
        label.text = K.arrayExplosion[0]
        label.textColor = .purpleLabel
        label.font = .boldSystemFont(ofSize: 20)
        label.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(selectedExplosionLabelTapped))
        label.addGestureRecognizer(tapGesture)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var taskSwitch: UISwitch = {
        let mySwitch = UISwitch()
        mySwitch.isOn = true
        mySwitch.addTarget(self, action: #selector(taskSwitchChanged), for: .valueChanged)
        mySwitch.translatesAutoresizingMaskIntoConstraints = false
        return mySwitch
    }()
    
    private lazy var musicSwitch: UISwitch = {
        let mySwitch = UISwitch()
        mySwitch.isOn = true
        mySwitch.addTarget(self, action: #selector(musicSwitchChanged), for: .valueChanged)
        mySwitch.translatesAutoresizingMaskIntoConstraints = false
        return mySwitch
    }()
    
    private lazy var timeLabel: UILabel = {
        let label = UILabel()
        label.text = "Время игры"
        label.textColor = .purpleLabel
        label.font = .boldSystemFont(ofSize: 22)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var taskLabel: UILabel = {
        let label = UILabel()
        label.text = "Игра с Заданиями"
        label.textColor = .purpleLabel
        label.font = .boldSystemFont(ofSize: 22)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var backMusicLabel: UILabel = {
        let label = UILabel()
        label.text = "Фоновая Музыка"
        label.textColor = .purpleLabel
        label.font = .boldSystemFont(ofSize: 22)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var musicLabel: UILabel = {
        let label = UILabel()
        label.text = "Фоновая Музыка"
        label.textColor = .purpleLabel
        label.font = .boldSystemFont(ofSize: 22)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var tickLabel: UILabel = {
        let label = UILabel()
        label.text = "Тиканье Бомбы"
        label.textColor = .purpleLabel
        label.font = .boldSystemFont(ofSize: 22)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var explosionLabel: UILabel = {
        let label = UILabel()
        label.text = "Взрыв Бомбы"
        label.textColor = .purpleLabel
        label.font = .boldSystemFont(ofSize: 22)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let shortButton = CustomButton(customTitle: "Короткое")
    let normalButton = CustomButton(customTitle: "Среднее")
    let longButton = CustomButton(customTitle: "Длинное")
    let randomButton = CustomButton(customTitle: "Случайное")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Настройки"
        subviews()
        setupConstraints()
        setup()
        musicPickerView.musicPickerDelegate = self
        tickPickerView.tickPickerDelegate = self
        explosionPickerView.explosionPickerDelegate = self
    }
    
    private func subviews() {
        view.addSubview(gradientView)
        view.addSubview(timeLabel)
        view.addSubview(shortButton)
        view.addSubview(normalButton)
        view.addSubview(longButton)
        view.addSubview(randomButton)
        view.addSubview(taskLabel)
        view.addSubview(backMusicLabel)
        view.addSubview(musicLabel)
        view.addSubview(tickLabel)
        view.addSubview(explosionLabel)
        view.addSubview(taskSwitch)
        view.addSubview(musicSwitch)
        view.addSubview(musicPickerView)
        view.addSubview(selectedMusicLabel)
        view.addSubview(tickPickerView)
        view.addSubview(selectedTickLabel)
        view.addSubview(explosionPickerView)
        view.addSubview(selectedExplosionLabel)
        
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            gradientView.topAnchor.constraint(equalTo: view.topAnchor),
            gradientView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            gradientView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            gradientView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            timeLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 120),
            timeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            shortButton.topAnchor.constraint(equalTo: timeLabel.bottomAnchor, constant: 15),
            shortButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 60),
            shortButton.heightAnchor.constraint(equalToConstant: 40),
            shortButton.widthAnchor.constraint(equalToConstant: 150),
            
            normalButton.topAnchor.constraint(equalTo: timeLabel.bottomAnchor, constant: 15),
            normalButton.leadingAnchor.constraint(equalTo: shortButton.trailingAnchor, constant: 10),
            normalButton.heightAnchor.constraint(equalToConstant: 40),
            normalButton.widthAnchor.constraint(equalToConstant: 150),
            
            longButton.topAnchor.constraint(equalTo: shortButton.bottomAnchor, constant: 10),
            longButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 60),
            longButton.heightAnchor.constraint(equalToConstant: 40),
            longButton.widthAnchor.constraint(equalToConstant: 150),
            
            randomButton.topAnchor.constraint(equalTo: normalButton.bottomAnchor, constant: 10),
            randomButton.leadingAnchor.constraint(equalTo: longButton.trailingAnchor, constant: 10),
            randomButton.heightAnchor.constraint(equalToConstant: 40),
            randomButton.widthAnchor.constraint(equalToConstant: 150),
            
            taskLabel.topAnchor.constraint(equalTo: longButton.bottomAnchor, constant: 55),
            taskLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            backMusicLabel.topAnchor.constraint(equalTo: taskLabel.bottomAnchor, constant: 55),
            backMusicLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            musicLabel.topAnchor.constraint(equalTo: backMusicLabel.bottomAnchor, constant: 55),
            musicLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            tickLabel.topAnchor.constraint(equalTo: musicLabel.bottomAnchor, constant: 55),
            tickLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            explosionLabel.topAnchor.constraint(equalTo: tickLabel.bottomAnchor, constant: 55),
            explosionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            taskSwitch.topAnchor.constraint(equalTo: longButton.bottomAnchor, constant: 55),
            taskSwitch.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            musicSwitch.topAnchor.constraint(equalTo: taskLabel.bottomAnchor, constant: 55),
            musicSwitch.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            musicPickerView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 15),
            musicPickerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            selectedMusicLabel.topAnchor.constraint(equalTo: backMusicLabel.bottomAnchor, constant: 55),
            selectedMusicLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            selectedMusicLabel.widthAnchor.constraint(equalToConstant: 120),
            
            tickPickerView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 15),
            tickPickerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            selectedTickLabel.topAnchor.constraint(equalTo: musicLabel.bottomAnchor, constant: 55),
            selectedTickLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 15),
            selectedTickLabel.widthAnchor.constraint(equalToConstant: 120),
            
            explosionPickerView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 15),
            explosionPickerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            selectedExplosionLabel.topAnchor.constraint(equalTo: tickLabel.bottomAnchor, constant: 55),
            selectedExplosionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 22),
            selectedExplosionLabel.widthAnchor.constraint(equalToConstant: 120),
            
            
            
        ])
    }
    
    func setup() {
        shortButton.addTarget(self, action: #selector(shortButtonPressed), for: .touchUpInside)
        normalButton.addTarget(self, action: #selector(normalButtonPressed), for: .touchUpInside)
        longButton.addTarget(self, action: #selector(longButtonPressed), for: .touchUpInside)
        randomButton.addTarget(self, action: #selector(randomButtonPressed), for: .touchUpInside)
        
        shortButton.titleLabel?.font = .boldSystemFont(ofSize: 18)
        shortButton.layer.cornerRadius = 20
        
        normalButton.titleLabel?.font = .boldSystemFont(ofSize: 18)
        normalButton.layer.cornerRadius = 20
        normalButton.backgroundColor = .yellowLabel
        normalButton.setTitleColor(.purpleLabel, for: .normal)
        
        longButton.titleLabel?.font = .boldSystemFont(ofSize: 18)
        longButton.layer.cornerRadius = 20
        longButton.backgroundColor = .yellowLabel
        longButton.setTitleColor(.purpleLabel, for: .normal)
        
        randomButton.titleLabel?.font = .boldSystemFont(ofSize: 18)
        randomButton.layer.cornerRadius = 20
        randomButton.backgroundColor = .yellowLabel
        randomButton.setTitleColor(.purpleLabel, for: .normal)
        
        taskSwitch.onTintColor = .purpleColor
        taskSwitch.thumbTintColor = .yellowLabel
        
        musicSwitch.onTintColor = .purpleColor
        musicSwitch.thumbTintColor = .yellowLabel
    }
    
    @objc func shortButtonPressed() {
        shortButton.backgroundColor = .purpleLabel
        shortButton.setTitleColor(.yellowLabel, for: .normal)
        
        normalButton.backgroundColor = .yellowLabel
        normalButton.setTitleColor(.purpleLabel, for: .normal)
        
        longButton.backgroundColor = .yellowLabel
        longButton.setTitleColor(.purpleLabel, for: .normal)
        
        randomButton.backgroundColor = .yellowLabel
        randomButton.setTitleColor(.purpleLabel, for: .normal)
    }
    
    @objc func normalButtonPressed() {
        normalButton.backgroundColor = .purpleLabel
        normalButton.setTitleColor(.yellowLabel, for: .normal)
        
        shortButton.backgroundColor = .yellowLabel
        shortButton.setTitleColor(.purpleLabel, for: .normal)
        
        longButton.backgroundColor = .yellowLabel
        longButton.setTitleColor(.purpleLabel, for: .normal)
        
        randomButton.backgroundColor = .yellowLabel
        randomButton.setTitleColor(.purpleLabel, for: .normal)
    }
    
    @objc func longButtonPressed() {
        longButton.backgroundColor = .purpleLabel
        longButton.setTitleColor(.yellowLabel, for: .normal)
        
        normalButton.backgroundColor = .yellowLabel
        normalButton.setTitleColor(.purpleLabel, for: .normal)
        
        shortButton.backgroundColor = .yellowLabel
        shortButton.setTitleColor(.purpleLabel, for: .normal)
        
        randomButton.backgroundColor = .yellowLabel
        randomButton.setTitleColor(.purpleLabel, for: .normal)
    }
    
    @objc func randomButtonPressed() {
        randomButton.backgroundColor = .purpleLabel
        randomButton.setTitleColor(.yellowLabel, for: .normal)
        
        normalButton.backgroundColor = .yellowLabel
        normalButton.setTitleColor(.purpleLabel, for: .normal)
        
        longButton.backgroundColor = .yellowLabel
        longButton.setTitleColor(.purpleLabel, for: .normal)
        
        shortButton.backgroundColor = .yellowLabel
        shortButton.setTitleColor(.purpleLabel, for: .normal)
    }
    

    
    @objc func taskSwitchChanged(_ sender: UISwitch) {
        if sender.isOn {
            print("Is On")
        } else {
            print("Disabled")
        }
    }
    
    @objc func musicSwitchChanged(_ sender: UISwitch) {
        if sender.isOn {
            print("Is On")
        } else {
            print("Disabled")
        }
    }
    
    @objc private func selectedMusicLabelTapped() {
        musicPickerView.isHidden.toggle()
    }
    
    @objc private func selectedTickLabelTapped() {
        tickPickerView.isHidden.toggle()
    }
    
    @objc private func selectedExplosionLabelTapped() {
        explosionPickerView.isHidden.toggle()
    }
}

extension SettingsViewController: MusicPickerDelegate {
    func didSelectMusicValue(_ value: String) {
        selectedMusicLabel.text = value
        musicPickerView.isHidden = true
    }
}

extension SettingsViewController: TickPickerDelegate {
    func didSelectTickValue(_ value: String) {
        selectedTickLabel.text = value
        tickPickerView.isHidden = true
    }
}

extension SettingsViewController: ExplosionPickerDelegate {
    func didSelectExplosionValue(_ value: String) {
        selectedExplosionLabel.text = value
        explosionPickerView.isHidden = true
    }
}
