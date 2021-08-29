//
//  ReminderListViewViewCodeTests.swift
//  HeremindersTests
//
//  Created by Dairan on 25/08/21.
//  Copyright © 2021 Rodrigo Borges. All rights reserved.
//

@testable import Hereminders
import SnapshotTesting
import XCTest

class ReminderListViewViewCodeTests: XCTestCase {
  func testReminderListViewViewCode() throws {

    let titleSubtitleVM: TitleSubtitleViewModel = TitleSubtitleViewModel(title: "Nome do endereço", subtitle: "Rua Bela Cinta dos Anjois, 1200")
    let reminders: [ReminderItemModel] = [
      ReminderItemModel(description: "Jogar água na planta", event: true),
      ReminderItemModel(description: "Tirar roupas do varal", event: false),
      ReminderItemModel(description: "Deslgar as luzes", event: true),
    ]
    let buttonVM = ButtonViewModel(titleButton: L10n.Reminderlist.addReminder)

    let viewModel = ReminderListViewViewCodeViewModel(titleSubtitleViewModel: titleSubtitleVM,
                                                      remindersViewModel: reminders,
                                                      buttonViewModel: buttonVM)
    let sut = ReminderListViewController(with: viewModel)

    let snapshopSize = CGSize(width: 375, height: 600)
    assertSnapshot(matching: sut, as: .image(size: snapshopSize), record: false)
    assertSnapshot(matching: sut, as: .recursiveDescription, record: false)
  }
}
