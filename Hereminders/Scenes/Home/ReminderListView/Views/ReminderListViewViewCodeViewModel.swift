//
//  ReminderListViewViewCodeViewModel.swift
//  Hereminders
//
//  Created by Dairan on 27/08/21.
//  Copyright © 2021 Rodrigo Borges. All rights reserved.
//

import Foundation

// MARK: - ReminderItemModel

struct ReminderItemModel {
  let description: String
  let event: Bool
}

// MARK: - ReminderListViewViewCodeViewModel

struct ReminderListViewViewCodeViewModel {
  let titleSubtitleViewModel: TitleSubtitleViewModel
  let remindersViewModel: [ReminderItemModel]
  let buttonViewModel: ButtonViewModel
}
