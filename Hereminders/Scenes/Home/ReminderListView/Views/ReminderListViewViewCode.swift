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

  init() {
    super.init(frame: .zero)
    backgroundColor = .white
    configure()
    configureSubviews()
    configureConstraints()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  // MARK: Internal

  let lembretes = [
    LembreteVM(descricao: "Tirar roupas do varal", horario: "Ao chegar"),
    LembreteVM(descricao: "Jogar água na planta", horario: "Quando anoitecer"),
    LembreteVM(descricao: "Deslgar as luzes", horario: "Quando amanhecer"),
  ]

  // TODO: Criar viewModel da classe englobando os VMs abaixo
  func configure() {


    let titleVM = TitleSubtitleViewModel(title: "Nome do endereço", subtitle: "Rua Bela Cintra dos Anjois")
    titleSubtitle.configure(with: titleVM)

    let buttonVM = ButtonViewModel(titleButton: "teste do botao")
    buttonView.configure(with: buttonVM)
  }

  // MARK: Private

  private let stackView: UIStackView = {
    let stackView = UIStackView(frame: .zero)
    stackView.translatesAutoresizingMaskIntoConstraints = false
    stackView.axis = .vertical
    stackView.distribution = .fill
    stackView.alignment = .center
    stackView.spacing = 15
    return stackView
  }()

  private lazy var titleSubtitle: TitleSubtitleView = {
    let label = TitleSubtitleView()
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()

  private lazy var buttonView: ButtonView = {
    let button = ButtonView()
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()

  private lazy var reminderTableView: UITableView = {
    let tableView = UITableView()
    tableView.translatesAutoresizingMaskIntoConstraints = false
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: UITableViewCell.classIdentifier())
    tableView.delegate = self
    tableView.dataSource = self

    return tableView
  }()

  private func configureSubviews() {
    translatesAutoresizingMaskIntoConstraints = false
    addSubview(stackView)
    stackView.addArrangedSubview(titleSubtitle)
    stackView.addArrangedSubview(reminderTableView)
    stackView.addArrangedSubview(buttonView)
  }

  private func configureConstraints() {
    NSLayoutConstraint.activate([
      stackView.topAnchor.constraint(equalTo: topAnchor),
      stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
      stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
      stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
//      stackView.heightAnchor.constraint(equalToConstant: 420),

//      titleSubtitle.heightAnchor.constraint(equalToConstant: 80),

//      reminderTableView.topAnchor.constraint(equalTo: stackView.topAnchor, constant: 25),
//      reminderTableView.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
//      reminderTableView.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
//      reminderTableView.bottomAnchor.constraint(equalTo: stackView.bottomAnchor),
      reminderTableView.widthAnchor.constraint(equalTo: stackView.widthAnchor),
      reminderTableView.heightAnchor.constraint(equalToConstant: 300),

//      buttonView.heightAnchor.constraint(equalToConstant: 44),
    ])
  }
}

// MARK: UITableViewDelegate

extension ReminderListViewViewCode: UITableViewDelegate {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    lembretes.count
  }
}

// MARK: UITableViewDataSource

extension ReminderListViewViewCode: UITableViewDataSource {
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let lembrete = lembretes[indexPath.row].descricao
    let cell = tableView.dequeueReusableCell(withIdentifier: UITableViewCell.classIdentifier(), for: indexPath)
    cell.textLabel?.text = lembrete
    return cell
  }
}
