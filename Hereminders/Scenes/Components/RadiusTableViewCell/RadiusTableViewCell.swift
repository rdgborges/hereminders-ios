//
//  RadiusTableViewCell.swift
//  Hereminders
//
//  Created by Diego Llopis on 31/08/21.
//  Copyright © 2021 Rodrigo Borges. All rights reserved.
//

import UIKit

class RadiusTableViewCell: UITableViewCell {
    
    let radiusSlider: UISlider = {
        let slider = UISlider()
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.tintColor = UIColor.heremindersBlue
        slider.addTarget(self, action: #selector(sliderChanged(sender:)), for: .valueChanged)
        slider.minimumValue = 100
        slider.maximumValue = 500
        return slider
    }()
    
    let radiusLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        self.configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func sliderChanged(sender: UISlider) {
        let value = Int(sender.value)
        radiusLabel.text = String(value) + " m"
    }
    
    func configure(with viewModel: RadiusTableViewCellModel) {

        radiusSlider.value = Float(viewModel.value)
    }
}

extension RadiusTableViewCell: ViewProtocol {
    
    func configureSubviews() {
        self.backgroundColor = .white
        self.addSubview(radiusSlider)
        self.addSubview(radiusLabel)
    }
    
    func configureConstraints() {
        NSLayoutConstraint.activate([

            radiusSlider.centerXAnchor.constraint(equalTo: centerXAnchor),
            radiusSlider.centerYAnchor.constraint(equalTo: centerYAnchor),
            radiusSlider.widthAnchor.constraint(equalToConstant: 100),

            radiusLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            radiusLabel.bottomAnchor.constraint(equalTo: radiusSlider.topAnchor),
        ])

    }
    
}
