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
    private var viewModel = ContributorsViewModel()

    override func loadView() {
        self.contributorsView = ContributorsView()
        self.view = self.contributorsView
    }

	override func viewDidLoad() {
		super.viewDidLoad()
        self.contributorsView?.configure(with: viewModel)
	}

	private func configureView() {
		view.backgroundColor = .white
		title = L10n.Settings.contributors
	}
}
