//
//  ContributorsView.swift
//  Hereminders
//
//  Created by Gabriela Sillis on 02/09/21.
//  Copyright © 2021 Rodrigo Borges. All rights reserved.
//

import UIKit

protocol ContributorsViewProtocol: AnyObject {
    func reloadData()
}


class ContributorsView: UIView {

    private weak var delegate: ContributorsViewProtocol?

    // MARK: - UIView
    lazy var contributorsTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .white
        tableView.register(ContributorTableViewCell.self, forCellReuseIdentifier: ContributorTableViewCell.classIdentifier())
        tableView.tableFooterView = UIView()

        return tableView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Delegates
    func delegate(delegate: ContributorsViewProtocol) {
        self.delegate = delegate
    }

    func delegate(delegate: UITableViewDelegate, dataSource: UITableViewDataSource) {
        self.contributorsTableView.delegate = delegate
        self.contributorsTableView.dataSource = dataSource
    }

    //MARK: - ViewModel
    private let role: String = "Developer Fellow @ Devpass"
    private let alexandre = Asset.ContributorsImages.alexandreCardoso.image
    private let dairan = Asset.ContributorsImages.dairanTemoteo.image
    private let diego = Asset.ContributorsImages.diegoLlopis.image
    private let gabriela = Asset.ContributorsImages.gabrielaSillis.image
    private let rodrigo = Asset.ContributorsImages.rodrigoBorges.image
    private let sara = Asset.ContributorsImages.saraFelix.image

    private var arrayContributors: [ContribuitorTableViewCellViewModel] = []

    private func getContributors(title: String, subtitle: String, image: Image) -> ContribuitorTableViewCellViewModel {

        return ContribuitorTableViewCellViewModel(titleSubtitleViewVM: TitleSubtitleViewModel(title: title, subtitle: subtitle), circurlarImageViewVM: CircularImageViewModel(with: image))
    }

    func returnContributorsArray() {
       let contributors = [self.getContributors(title: "Alexandre Cardoso", subtitle: role, image: alexandre),
        self.getContributors(title: "Dairan Temoteo", subtitle: role, image: dairan),
        self.getContributors(title: "Diego Llopis", subtitle: role, image: diego),
        self.getContributors(title: "Gabriela Sillis", subtitle: role, image: gabriela),
        self.getContributors(title: "Rodrigo Borges", subtitle: role, image: rodrigo),
        self.getContributors(title: "Sara Felix", subtitle: role, image: sara)]

        for index in contributors {
            self.arrayContributors.append(index)
        }

        self.delegate?.reloadData()
    }

    func loadCurrentCell(indexPath: IndexPath) -> ContribuitorTableViewCellViewModel {
        return self.arrayContributors[indexPath.row]
    }

    func contributorsArrayCount() -> Int {
        return self.arrayContributors.count
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
