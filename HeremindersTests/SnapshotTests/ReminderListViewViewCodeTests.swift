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
    let sut = ReminderListViewViewCode()

    let snapshopSize = CGSize(width: 1125, height: 2436)
    assertSnapshot(matching: sut, as: .image(size: snapshopSize), record: true)
//    assertSnapshot(matching: sut, as: .image(), record: true)

    assertSnapshot(matching: sut, as: .recursiveDescription, record: true)
  }
}
