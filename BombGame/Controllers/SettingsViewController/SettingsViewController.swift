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
    
    let musicPicker = MusicPickerView()
    
//    private lazy var musicPicker: UIPickerView = {
//        let picker = UIPickerView()
//        picker.delegate = self
//        picker.dataSource = self
//        picker.translatesAutoresizingMaskIntoConstraints = false
//        return picker
//    }()
    
    private lazy var tickPicker: UIPickerView = {
        let picker = UIPickerView()
        picker.delegate = self
        picker.dataSource = self
        picker.translatesAutoresizingMaskIntoConstraints = false
        return picker
    }()
    
    private lazy var explosionPicker: UIPickerView = {
        let picker = UIPickerView()
        picker.delegate = self
        picker.dataSource = self
        picker.translatesAutoresizingMaskIntoConstraints = false
        return picker
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
        view.addSubview(musicPicker)
        view.addSubview(tickPicker)
        view.addSubview(explosionPicker)
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
            
            musicPicker.topAnchor.constraint(equalTo: backMusicLabel.bottomAnchor, constant: 55),
            musicPicker.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            musicPicker.widthAnchor.constraint(equalToConstant: 100),
            
            tickPicker.topAnchor.constraint(equalTo: musicLabel.bottomAnchor, constant: 55),
            tickPicker.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            explosionPicker.topAnchor.constraint(equalTo: tickLabel.bottomAnchor, constant: 55),
            explosionPicker.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),

        ])
    }
    
    func setup() {
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
}

extension SettingsViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 3
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "K.fon[row]"
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        return print("didSelectRow")
    }
}

