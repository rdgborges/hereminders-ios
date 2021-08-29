//
//  ReminderListViewController.swift
//  Hereminders
//
//  Created by Dairan on 29/08/21.
//  Copyright © 2021 Rodrigo Borges. All rights reserved.
//

import UIKit

class ReminderListViewController: UIViewController {
  // MARK: Lifecycle

  init(with viewModel: ReminderListViewViewCodeViewModel) {
    self.viewModel = viewModel
    super.init(nibName: nil, bundle: nil)
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  // MARK: Internal

  let viewModel: ReminderListViewViewCodeViewModel

  override func viewDidLoad() {
    super.viewDidLoad()
  }

  override func loadView() {
    let reminderView = ReminderListViewViewCode(with: viewModel)
    view = reminderView
  }

  // MARK: Private

  private func addConstraints() {}
}
