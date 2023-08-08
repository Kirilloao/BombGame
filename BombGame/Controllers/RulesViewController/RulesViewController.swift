//
//  RulesViewController.swift
//  BombGame
//
//  Created by Александра Савчук on 07.08.2023.
//

import UIKit

class RulesViewController: UIViewController {

    private lazy var gradientView: GradientView = {
        let gradientView = GradientView(frame: view.bounds)
        gradientView.translatesAutoresizingMaskIntoConstraints = false
        return gradientView
    }()

    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()

    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    private let rules: [(text: String, image: UIImage?)] = [
        ("Правило 1", nil),
        ("Правило 2", UIImage(named: "imageName")),
        // Добавьте остальные правила здесь
    ]

    private func setupTableView() {
        tableView.dataSource = self
        tableView.tableFooterView = UIView()

        // Register custom cell classes
        tableView.register(TextRuleCell.self, forCellReuseIdentifier: TextRuleCell.identifier)
        tableView.register(ImageRuleCell.self, forCellReuseIdentifier: ImageRuleCell.identifier)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavigationBar(title: "Помощь")
        setupTableView()
        subviews()
        setupConstraints()

    }

    private func subviews() {
        view.addSubview(gradientView)
        gradientView.addSubview(scrollView)
        scrollView.addSubview(tableView)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            gradientView.topAnchor.constraint(equalTo: view.topAnchor),
            gradientView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            gradientView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            gradientView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            scrollView.leadingAnchor.constraint(equalTo: gradientView.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: gradientView.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: gradientView.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: gradientView.bottomAnchor),

            tableView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            tableView.widthAnchor.constraint(equalTo: scrollView.widthAnchor) // Match tableView's width to scrollView's width
        ])

        // Set the contentSize of the scrollView to fit the tableView's content
        scrollView.contentSize = CGSize(width: view.bounds.width, height: tableView.contentSize.height)
    }
}

extension RulesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rules.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let (ruleText, ruleImage) = rules[indexPath.row]

        if let image = ruleImage {
            let cell = tableView.dequeueReusableCell(withIdentifier: ImageRuleCell.identifier, for: indexPath) as! ImageRuleCell
            cell.configure(with: ruleText, bullet: "•", image: image)
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: TextRuleCell.identifier, for: indexPath) as! TextRuleCell
            cell.configure(with: ruleText, bullet: "•")
            return cell
        }
    }
}
