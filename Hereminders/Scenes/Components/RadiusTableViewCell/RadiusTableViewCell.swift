//
//  RadiusTableViewCell.swift
//  Hereminders
//
//  Created by Diego Llopis on 31/08/21.
//  Copyright © 2021 Rodrigo Borges. All rights reserved.
//

import UIKit

class RadiusTableViewCell: UIView {
    
    let radiusSlider: UISlider = {
        let slider = UISlider()
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.tintColor = UIColor.heremindersBlue
        slider.thumbTintColor = UIColor.heremindersBlue
        slider.addTarget(self, action: #selector(sliderChanged(sender:)), for: .valueChanged)
        slider.minimumValue = 100
        slider.maximumValue = 500
        return slider
    }()
    
    let radiusLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "100 m"
        return label
    }()
    
    init() {
        
        super.init(frame: .zero)
        self.configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func sliderChanged(sender: UISlider) {
        let value = sender.value
        radiusLabel.text = String(value) + " m"
    }
    
    func configure() {
        radiusSlider.value = 250
    }
}

extension RadiusTableViewCell: ViewProtocol {
    
    func configureSubviews() {
        self.backgroundColor = .white
        self.addSubview(radiusSlider)
        self.addSubview(radiusLabel)
    }
    
    func configureConstraints() {
        radiusSlider.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        radiusSlider.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        radiusSlider.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        radiusLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        radiusLabel.bottomAnchor.constraint(equalTo: radiusSlider.topAnchor).isActive = true
    }
    
    
    
}
