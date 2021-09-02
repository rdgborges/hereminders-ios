//
//  RadiusTableViewCellSnapshotTest.swift
//  HeremindersTests
//
//  Created by Diego Llopis on 31/08/21.
//  Copyright © 2021 Rodrigo Borges. All rights reserved.
//

import XCTest
import SnapshotTesting
@testable import Hereminders

class RadiusTableViewCellSnapshotTest: XCTestCase {

    func testRadiusTableViewCell() throws {
        
        let radiusTableViewCell = RadiusTableViewCell()
        
        radiusTableViewCell.configure()
        
        assertSnapshot(matching: radiusTableViewCell , as: Snapshotting.image(size: CGSize(width: 100, height: 100)))
    }

}
