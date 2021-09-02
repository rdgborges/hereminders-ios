//
//  ContributorsViewController.swift
//  Hereminders
//
//  Created by Alexandre Cardoso on 31/08/21.
//  Copyright © 2021 Rodrigo Borges. All rights reserved.
//

import UIKit

class ContributorsViewController: UIViewController {

    private var contributorsView: ContributorsView?

    override func loadView() {
        self.contributorsView = ContributorsView()
        self.view = self.contributorsView

    }
	
	override func viewDidLoad() {
		super.viewDidLoad()
        self.contributorsView?.delegate(delegate: self, dataSource: self)
        self.contributorsView?.delegate(delegate: self)
        self.contributorsView?.returnContributorsArray()
	}
	
	private func configureView() {
		view.backgroundColor = .white
		title = L10n.Settings.contributors
	}
}

extension ContributorsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let count = self.contributorsView?.contributorsArrayCount() else { return 0}
        return count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ContributorTableViewCell.classIdentifier(), for: indexPath) as? ContributorTableViewCell
        cell?.accessoryType = .disclosureIndicator

        if let model = self.contributorsView?.loadCurrentCell(indexPath: indexPath) {
            cell?.configure(with: model)
        }
        return cell ?? UITableViewCell()
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}

extension ContributorsViewController: ContributorsViewProtocol {
    func reloadData() {
        self.contributorsView?.contributorsTableView.reloadData()
    }
}
