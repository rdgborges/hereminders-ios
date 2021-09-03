//
//  ContributorsViewSnapshotTests.swift
//  HeremindersTests
//
//  Created by Gabriela Sillis on 02/09/21.
//  Copyright © 2021 Rodrigo Borges. All rights reserved.
//

import XCTest
import SnapshotTesting
@testable import Hereminders

class ContributorsViewSnapshotTests: XCTestCase {

    func testContributorsView() {
        let vc = ContributorsViewController()

        assertSnapshot(matching: vc, as: .image(on: .iPhoneSe), record: false)
    }

}
