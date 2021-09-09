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
        let width = UIScreen.main.bounds.width
        let height = UIScreen.main.bounds.height
        let size = CGSize(width: width, height: height)
        assertSnapshot(matching: vc, as: Snapshotting.image(size: size), record: false)
    }

}
