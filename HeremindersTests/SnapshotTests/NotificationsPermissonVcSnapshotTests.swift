//
//  NotificationsPermissonVcSnapshotTests.swift
//  HeremindersTests
//
//  Created by Felipe Forcinetti on 15/09/21.
//  Copyright © 2021 Rodrigo Borges. All rights reserved.
//

import XCTest
import SnapshotTesting
@testable import Hereminders

class NotificationsPermissonVcSnapshotTests: XCTestCase {
    
    let sut = NotificationPermissonViewController()
    let viewModelMock = NotificationsPermissonViewModel(title: "Notificações",
                                                        subtitle: "O Hereminders precisa da permissão à notificações para funcionar. Vamos avisar você sobre os seus lembretes sempre que sair ou entrar em algum local.",
                                                        button:ButtonViewModel.init(titleButton: "Dar permissão à notificações"))
    
    func testNotificationsPermissions() {
        sut.configure(with: viewModelMock)
        assertSnapshot(matching: sut, as: .image(on: .iPhoneX))
    }
}
