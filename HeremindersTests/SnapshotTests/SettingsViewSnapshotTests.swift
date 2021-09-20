//
//  SettingsViewSnapshotTests.swift
//  HeremindersTests
//
//  Created by joao camargo on 17/09/21.
//  Copyright © 2021 Rodrigo Borges. All rights reserved.
//

import Foundation

@testable import Hereminders
import SnapshotTesting
import XCTest


class SettingsViewSnapshotTests: XCTestCase {
    
    override class func setUp() {
        isRecording = false
    }
    
    
    
    func testSettingsView() { // (imagem)
        let sut = SettingsViewController(delegate: self)
        let width = UIScreen.main.bounds.width
        let height = UIScreen.main.bounds.height
        let size = CGSize(width: width, height: height)
        
        assertSnapshot(matching: sut, as: Snapshotting.image(size: size))
    }
}

extension SettingsViewSnapshotTests: SettingsViewControllerDelegate {
    func settingsViewControllerWantsToBecomePremium() {}
    func settingsViewControllerWantsToManagePlaces() {}
    func settingsViewControllerWantsToClose() {}
    func settingsViewControllerWantsToContributors() {}
}
