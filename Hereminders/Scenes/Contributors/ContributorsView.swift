//
//  ContributorsView.swift
//  Hereminders
//
//  Created by Gabriela Sillis on 02/09/21.
//  Copyright © 2021 Rodrigo Borges. All rights reserved.
//

import UIKit


class ContributorsView: UIView {

    lazy var contributorsTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .white
        tableView.register(ContributorTableViewCell.self, forCellReuseIdentifier: ContributorTableViewCell.classIdentifier())
       // tableView.tableFooterView = UIView()

        return tableView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func delegate(delegate: UITableViewDelegate, dataSource: UITableViewDataSource) {
        self.contributorsTableView.delegate = delegate
        self.contributorsTableView.dataSource = dataSource
    }
}

extension ContributorsView: ViewProtocol {
    func configureSubviews() {
        self.addSubview(self.contributorsTableView)
    }

    func configureConstraints() {
        NSLayoutConstraint.activate([
            self.contributorsTableView.topAnchor.constraint(equalTo: self.topAnchor), self.contributorsTableView.bottomAnchor.constraint(equalTo: self.bottomAnchor), self.contributorsTableView.leadingAnchor.constraint(equalTo: self.leadingAnchor), self.contributorsTableView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }
}
