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
		
		configureView()
        self.contributorsView?.delegate(delegate: self, dataSource: self)
	}
	
	private func configureView() {
		view.backgroundColor = .white
		title = L10n.Settings.contributors
	}
}

extension ContributorsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ContributorTableViewCell? = tableView.dequeueReusableCell(withIdentifier: ContributorTableViewCell.classIdentifier(), for: indexPath) as? ContributorTableViewCell

        return cell ?? UITableViewCell()
    }
}
