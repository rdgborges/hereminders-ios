//
//  ContributorsViewModel.swift
//  Hereminders
//
//  Created by Gabriela Sillis on 03/09/21.
//  Copyright © 2021 Rodrigo Borges. All rights reserved.
//

import Foundation

class ContributorsViewModel {

    private let alexandre =
        ContribuitorTableViewCellViewModel(titleSubtitleViewVM: TitleSubtitleViewModel(title: "Alexandre Cardoso", subtitle: "Developer Fellow @ Devpass", urlLinkedin: "https://www.linkedin.com/in/alexandre-barbosa-cardoso-a02a3a173"), circurlarImageViewVM: CircularImageViewModel(with:  Asset.alexandreCardoso.image))

    private let  dairan =
        ContribuitorTableViewCellViewModel(titleSubtitleViewVM: TitleSubtitleViewModel(title: "Dairan Temoteo", subtitle: "Developer Fellow @ Devpass", urlLinkedin: "https://www.linkedin.com/in/dairan"), circurlarImageViewVM: CircularImageViewModel(with:  Asset.dairanTemoteo.image))

    private let  diego =
        ContribuitorTableViewCellViewModel(titleSubtitleViewVM: TitleSubtitleViewModel(title: "Diego Llopis", subtitle: "Developer Fellow @ Devpass", urlLinkedin: "https://www.linkedin.com/in/diego-llopis36"), circurlarImageViewVM: CircularImageViewModel(with:  Asset.diegoLlopis.image))

    private let  gabriela =
        ContribuitorTableViewCellViewModel(titleSubtitleViewVM: TitleSubtitleViewModel(title: "Gabriela Sillis", subtitle: "Developer Fellow @ Devpass", urlLinkedin: "https://www.linkedin.com/in/gabrielasillis"), circurlarImageViewVM: CircularImageViewModel(with:  Asset.gabrielaSillis.image))

    private let  rodrigo =
        ContribuitorTableViewCellViewModel(titleSubtitleViewVM: TitleSubtitleViewModel(title: "Rodrigo Borges", subtitle: "Developer Fellow @ Devpass", urlLinkedin: "https://www.linkedin.com/in/rdgborges"), circurlarImageViewVM: CircularImageViewModel(with:  Asset.rodrigoBorges.image))

    private let  sara =
        ContribuitorTableViewCellViewModel(titleSubtitleViewVM: TitleSubtitleViewModel(title: "Sara Felix", subtitle: "Developer Fellow @ Devpass", urlLinkedin: "https://www.linkedin.com/in/sarabfelix"), circurlarImageViewVM: CircularImageViewModel(with:  Asset.saraFelix.image))
    
    func getArrayContributor() -> [ContribuitorTableViewCellViewModel] {
        let array = [alexandre, dairan, diego, gabriela, rodrigo, sara]

        return array
    }
}
