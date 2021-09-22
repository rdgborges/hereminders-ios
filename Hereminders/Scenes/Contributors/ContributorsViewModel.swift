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
        ContribuitorTableViewCellViewModel(titleSubtitleViewVM: TitleSubtitleViewModel(title: "Alexandre Cardoso", subtitle: "Developer Fellow @ Devpass"), circurlarImageViewVM: CircularImageViewModel(with:  Asset.ContributorsImages.alexandreCardoso.image))

    private let  dairan =
        ContribuitorTableViewCellViewModel(titleSubtitleViewVM: TitleSubtitleViewModel(title: "Dairan Temoteo", subtitle: "Developer Fellow @ Devpass"), circurlarImageViewVM: CircularImageViewModel(with:  Asset.ContributorsImages.dairanTemoteo.image))

    private let  diego =
        ContribuitorTableViewCellViewModel(titleSubtitleViewVM: TitleSubtitleViewModel(title: "Diego Llopis", subtitle: "Developer Fellow @ Devpass"), circurlarImageViewVM: CircularImageViewModel(with:  Asset.ContributorsImages.diegoLlopis.image))

    private let  gabriela =
        ContribuitorTableViewCellViewModel(titleSubtitleViewVM: TitleSubtitleViewModel(title: "Gabriela Sillis", subtitle: "Developer Fellow @ Devpass"), circurlarImageViewVM: CircularImageViewModel(with:  Asset.ContributorsImages.gabrielaSillis.image))

    private let  rodrigo =
        ContribuitorTableViewCellViewModel(titleSubtitleViewVM: TitleSubtitleViewModel(title: "Rodrigo Borges", subtitle: "Developer Fellow @ Devpass"), circurlarImageViewVM: CircularImageViewModel(with:  Asset.ContributorsImages.rodrigoBorges.image))

    private let  sara =
        ContribuitorTableViewCellViewModel(titleSubtitleViewVM: TitleSubtitleViewModel(title: "Sara Felix", subtitle: "Developer Fellow @ Devpass"), circurlarImageViewVM: CircularImageViewModel(with:  Asset.ContributorsImages.saraFelix.image))
    
    private let  paola =
        ContribuitorTableViewCellViewModel(titleSubtitleViewVM: TitleSubtitleViewModel(title: "Paola Soares", subtitle: "Developer Fellow @ Devpass"), circurlarImageViewVM: CircularImageViewModel(with:  Asset.ContributorsImages.paolaSoares.image))
    
    private let  alan =
        ContribuitorTableViewCellViewModel(titleSubtitleViewVM: TitleSubtitleViewModel(title: "Alan Pereira", subtitle: "Developer Fellow @ Devpass"), circurlarImageViewVM: CircularImageViewModel(with:  Asset.ContributorsImages.alanPereira.image))
    
    private let  cassia =
        ContribuitorTableViewCellViewModel(titleSubtitleViewVM: TitleSubtitleViewModel(title: "Cassia Franco", subtitle: "Developer Fellow @ Devpass"), circurlarImageViewVM: CircularImageViewModel(with:  Asset.ContributorsImages.cassiaFranco.image))
    
    private let  joao =
        ContribuitorTableViewCellViewModel(titleSubtitleViewVM: TitleSubtitleViewModel(title: "João Camargo", subtitle: "Developer Fellow @ Devpass"), circurlarImageViewVM: CircularImageViewModel(with:  Asset.ContributorsImages.joaoCamargo.image))

    func getArrayContributor() -> [ContribuitorTableViewCellViewModel] {
        let array = [alan, alexandre, cassia, dairan, diego, gabriela, joao, paola, rodrigo, sara]

        return array
    }
}
