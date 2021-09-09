//
//  ContributorsView.swift
//  Hereminders
//
//  Created by Gabriela Sillis on 02/09/21.
//  Copyright © 2021 Rodrigo Borges. All rights reserved.
//

import UIKit

class ContributorsView: UIView {

    private var viewModel: ContributorsViewModel?
    private var arrayContributors: [ContribuitorTableViewCellViewModel] = []

    // MARK: - UIView
    lazy var contributorsTableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorInsetReference = .fromAutomaticInsets
        tableView.separatorInset = UIEdgeInsets(top: 0, left: -30, bottom: 0, right: 0)
        tableView.backgroundColor = .white
        tableView.register(ContributorTableViewCell.self, forCellReuseIdentifier: ContributorTableViewCell.classIdentifier())
        tableView.tableFooterView = UIView()
        tableView.delegate = self
        tableView.dataSource = self

        return tableView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with viewModel: ContributorsViewModel) {
        arrayContributors = viewModel.getArrayContributor()
        contributorsTableView.reloadData()
    }
}

// MARK: - extension ViewProtocol
extension ContributorsView: ViewProtocol {
    func configureSubviews() {
        addSubview(self.contributorsTableView)
    }

    func configureConstraints() {
        NSLayoutConstraint.activate([
            contributorsTableView.topAnchor.constraint(equalTo: self.topAnchor),
            contributorsTableView.bottomAnchor.constraint(equalTo: bottomAnchor),
            contributorsTableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            contributorsTableView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
}

// MARK: - extension UITableViewDelegate, UITableViewDataSource
extension ContributorsView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayContributors.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ContributorTableViewCell.classIdentifier(), for: indexPath) as? ContributorTableViewCell
        cell?.configure(with: arrayContributors[indexPath.row])

        return cell ?? UITableViewCell()
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}
