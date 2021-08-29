//
//  ReminderListViewViewCode.swift
//  Hereminders
//
//  Created by Dairan on 25/08/21.
//  Copyright © 2021 Rodrigo Borges. All rights reserved.
//

// MARK: - Layout
// https://www.notion.so/image/https%3A%2F%2Fs3-us-west-2.amazonaws.com%2Fsecure.notion-static.com%2F1c88407a-b729-4966-b89f-402d6d7207bd%2FScreen_Shot_2021-08-05_at_13.38.02.png?table=block&id=7c2b9194-3510-43c5-b27e-bd63e3157a28&spaceId=4055f95c-3cb2-49bd-af80-6342d6744fe5&width=2880&userId=f56d3b8f-5500-4291-96c0-08057c09216b&cache=v2

import UIKit

// MARK: - LembreteVM

struct LembreteVM {
  let descricao: String
  let horario: String
}

// MARK: - ReminderListViewViewCode

class ReminderListViewViewCode: UIView {
  // MARK: Lifecycle

  init(with viewModel: ReminderListViewViewCodeViewModel) {
    self.viewModel = viewModel
    super.init(frame: .zero)

    backgroundColor = .white
    configureSubviews()
    configureConstraints()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  // TODO: Criar viewModel da classe englobando os VMs abaixo

  // MARK: Private

  private let stackView: UIStackView = {
    let stackView = UIStackView(frame: .zero)
    stackView.translatesAutoresizingMaskIntoConstraints = false
    stackView.axis = .vertical
    stackView.distribution = .fill
    let marginEdge: CGFloat = 16
    stackView.isLayoutMarginsRelativeArrangement = true
    stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: marginEdge,
                                                                 leading: marginEdge,
                                                                 bottom: marginEdge,
                                                                 trailing: marginEdge)
    return stackView
  }()

  private lazy var titleSubtitle: TitleSubtitleView = {
    let label = TitleSubtitleView()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.configure(with: viewModel.titleSubtitleViewModel)
    return label
  }()

  private var dividerView: DividerView = {
    let divider = DividerView()
    return divider
  }()

  private lazy var reminderTableView: UITableView = {
    let tableView = UITableView()
    tableView.translatesAutoresizingMaskIntoConstraints = false
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: UITableViewCell.classIdentifier())
    tableView.delegate = self
    tableView.dataSource = self
    return tableView
  }()

  private lazy var buttonView: ButtonView = {
    let button = ButtonView()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.configure(with: viewModel.buttonViewModel)
    return button
  }()

  private var viewModel: ReminderListViewViewCodeViewModel

  private func configureSubviews() {
//    translatesAutoresizingMaskIntoConstraints = false
    addSubview(stackView)
    stackView.addArrangedSubview(titleSubtitle)
    stackView.addArrangedSubview(dividerView)
    stackView.addArrangedSubview(reminderTableView)
    stackView.addArrangedSubview(buttonView)
  }

  private func configureConstraints() {
    NSLayoutConstraint.activate([
      stackView.topAnchor.constraint(equalTo: topAnchor),
      stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
      stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
      stackView.bottomAnchor.constraint(equalTo: bottomAnchor),

      titleSubtitle.heightAnchor.constraint(equalToConstant: 56),

      reminderTableView.widthAnchor.constraint(equalTo: stackView.widthAnchor),
      
      buttonView.heightAnchor.constraint(equalToConstant: 44),
    ])
  }
}

// MARK: UITableViewDelegate

extension ReminderListViewViewCode: UITableViewDelegate {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//    viewModel.reminders.count
    viewModel.remindersViewModel.count
  }
}

// MARK: UITableViewDataSource

extension ReminderListViewViewCode: UITableViewDataSource {
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let lembrete = viewModel.remindersViewModel[indexPath.row].description
    let cell = tableView.dequeueReusableCell(withIdentifier: UITableViewCell.classIdentifier(), for: indexPath)
    cell.textLabel?.text = lembrete.description
    return cell
  }
}
