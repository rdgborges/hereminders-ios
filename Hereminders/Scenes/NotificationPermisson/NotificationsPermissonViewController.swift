//
//  NotificationPermissonView.swift
//  Hereminders
//
//  Created by Felipe Forcinetti on 15/09/21.
//  Copyright © 2021 Rodrigo Borges. All rights reserved.
//

import Foundation
import UIKit

class NotificationPermissonViewController: UIViewController {
     
    // MARK: - UIElements
    
    private let iconImageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = Asset.imgLogo.image
        imageView.contentMode = .scaleAspectFit
        
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let title = UILabel(frame: .zero)
        title.translatesAutoresizingMaskIntoConstraints = false
        title.numberOfLines = 0
        title.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        title.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        title.textAlignment = .center
        
        return title
    }()
    
    private let subtitleLabel: UILabel = {
        let subtitle = UILabel(frame: .zero)
        subtitle.translatesAutoresizingMaskIntoConstraints = false
        subtitle.numberOfLines = 0
        subtitle.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        subtitle.textColor = UIColor(red: 0.557, green: 0.557, blue: 0.556, alpha: 1)
        subtitle.textAlignment = .center
        
        return subtitle
    }()
    
    private let addNewPlaceButton: ButtonView = {
        let buttonView = ButtonView()
        buttonView.translatesAutoresizingMaskIntoConstraints = false
        
        return buttonView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configureSubviews()
        self.configureConstraints()
    }
    
    // MARK: - Functions
    private func configureSubviews() {
        view.addSubview(iconImageView)
        view.addSubview(titleLabel)
        view.addSubview(subtitleLabel)
        view.addSubview(addNewPlaceButton)
        view.backgroundColor = .white
    }
    
    private func configureConstraints() {
        NSLayoutConstraint.activate([
            
            // IconImageView
            iconImageView.bottomAnchor.constraint(equalTo: titleLabel.topAnchor, constant: -22),
            iconImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            iconImageView.heightAnchor.constraint(equalToConstant: 50),
            iconImageView.widthAnchor.constraint(equalToConstant: 50),
            
            // TitleLabel
            titleLabel.bottomAnchor.constraint(equalTo: subtitleLabel.topAnchor, constant: -7),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 99),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -99),
            
            // Subtitle_Label
            subtitleLabel.bottomAnchor.constraint(equalTo: addNewPlaceButton.topAnchor, constant: -29),
            subtitleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            subtitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 46),
            subtitleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -46),
            
            // AddNewPlaceButton
            addNewPlaceButton.heightAnchor.constraint(equalToConstant: 44),
            addNewPlaceButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            addNewPlaceButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
    }
    
    func configure(with viewModel: NotificationsPermissonViewModel) {
        titleLabel.text = viewModel.title
        subtitleLabel.text = viewModel.subtitle
        addNewPlaceButton.configure(with: viewModel.button)
    }
}
