//
//  RulesTableViewCell.swift
//  BombGame
//
//  Created by Александра Савчук on 08.08.2023.
//

import UIKit

class TextRuleCell: UITableViewCell {

  static let identifier = "TextRuleCell"

    private let bulletLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let ruleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
    }

    private func setupViews() {
        contentView.addSubview(bulletLabel)
        contentView.addSubview(ruleLabel)

        NSLayoutConstraint.activate([
            bulletLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            bulletLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),

            ruleLabel.leadingAnchor.constraint(equalTo: bulletLabel.trailingAnchor, constant: 8),
            ruleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            ruleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }

    func configure(with ruleText: String, bullet: String) {
        bulletLabel.text = bullet
        ruleLabel.text = ruleText
    }
}

class ImageRuleCell: UITableViewCell {

  static let identifier = "ImageRuleCell"

    private let bulletLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let ruleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let ruleImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
    }

    private func setupViews() {
        contentView.addSubview(bulletLabel)
        contentView.addSubview(ruleLabel)
        contentView.addSubview(ruleImageView)

        NSLayoutConstraint.activate([
            bulletLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            bulletLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),

            ruleLabel.leadingAnchor.constraint(equalTo: bulletLabel.trailingAnchor, constant: 8),
            ruleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            ruleLabel.topAnchor.constraint(equalTo: contentView.topAnchor),

            ruleImageView.topAnchor.constraint(equalTo: ruleLabel.bottomAnchor, constant: 8),
            ruleImageView.leadingAnchor.constraint(equalTo: bulletLabel.trailingAnchor, constant: 8),
            ruleImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            ruleImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }

    func configure(with ruleText: String, bullet: String, image: UIImage) {
        bulletLabel.text = bullet
        ruleLabel.text = ruleText
        ruleImageView.image = image
    }
}
