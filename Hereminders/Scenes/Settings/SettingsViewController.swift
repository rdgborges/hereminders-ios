//
//  SettingsViewController.swift
//  Hereminders
//
//  Created by Rodrigo Borges on 7/7/18.
//  Copyright © 2018 Rodrigo Borges. All rights reserved.
//

import UIKit



enum SectionName: Int, CaseIterable {
    case places
    case about
    case credits
    
    func getSectionName() -> String {
        switch self {
        case .places:
            return L10n.Settings.places
        case .about:
            return L10n.Settings.about
        case .credits:
            return L10n.Settings.credits
        }
    }
    
}

protocol SettingsViewControllerDelegate: AnyObject {
    
    func settingsViewControllerWantsToBecomePremium()
    func settingsViewControllerWantsToManagePlaces()
    func settingsViewControllerWantsToClose()
    func settingsViewControllerWantsToContributors()
}

class SettingsViewController: UIViewController {
    
    weak var delegate: SettingsViewControllerDelegate?
    
    let tableView = UITableView.init(frame: CGRect.zero, style: .grouped)
    let tbViewCellIdentifier = "SettingsCell"
    
    
    
    init(delegate: SettingsViewControllerDelegate) {
        self.delegate = delegate
        super.init(nibName: nil, bundle: nil)
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configureView()
    }
    
    func configureView() {
        
        self.configureNavigationBar()
        self.configureTableView()
    }
    
    func configureNavigationBar() {
        let barButtonItem = UIBarButtonItem.customBarButtonItem(with: Asset.iconCross.image,
                                                                for: self,
                                                                and: #selector(didTapOnCloseButton))
        self.navigationItem.leftBarButtonItem = barButtonItem
        self.navigationItem.title = L10n.Settings.title
    }
    
    func configureTableView() {
        self.view.addSubview(tableView)
        self.view.backgroundColor = .red
       
        tableView.anchor(top: view.topAnchor,
                         left: view.leftAnchor,
                         bottom: view.bottomAnchor,
                         right: view.rightAnchor)
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: tbViewCellIdentifier)
        tableView.backgroundColor = .systemGroupedBackground
        self.tableView.contentInset = UIEdgeInsets(top: 17.5, left: 0, bottom: 0, right: 0)


    }
    
    @objc private func didTapOnCloseButton() {
        
        self.delegate?.settingsViewControllerWantsToClose()
    }
}

extension SettingsViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return SectionName.allCases.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == SectionName.credits.rawValue {
            return 2
        }
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: tbViewCellIdentifier)
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: tbViewCellIdentifier)
        }
        
        //cell?.backgroundColor = .red
        
        guard let sectionIndex: SectionName = SectionName(rawValue: indexPath.section)
        else { return UITableViewCell() }
        
        switch sectionIndex {
        case .places:
            cell?.textLabel?.text = L10n.Settings.managePlaces
            cell?.accessoryType = .disclosureIndicator
            
        case .about:
            cell?.textLabel?.text = L10n.Settings.version(Bundle.versionNumber, Bundle.buildNumber)
            cell?.isUserInteractionEnabled = false
            
        case .credits:
            if indexPath.row == 0 {
                cell?.textLabel?.text = L10n.Settings.logoCredit
                cell?.isUserInteractionEnabled = false
            } else {
                cell?.textLabel?.text = L10n.Settings.contributors
                cell?.accessoryType = .disclosureIndicator
            }
            
        }
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard let sectionIndex: SectionName = SectionName(rawValue: section)
        else { return nil }
        return sectionIndex.getSectionName()
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.size.width, height: 58))
        //headerView.anchor(height: 38)
        headerView.backgroundColor = .systemGroupedBackground
        let sectionText = UILabel()
        //sectionText.frame = CGRect.init(x: 20, y: 0, width: headerView.frame.width, height: headerView.frame.height)
        sectionText.textAlignment = .left
        sectionText.textColor = UIColor.gray
        sectionText.font = UIFont.systemFont(ofSize: 13)
        sectionText.numberOfLines = 1
        
        sectionText.text = SectionName(rawValue: section)?.getSectionName().uppercased() ?? ""
        headerView.addSubview(sectionText)
        sectionText.anchor(top: headerView.topAnchor, left: headerView.leftAnchor,bottom: headerView.bottomAnchor, right: headerView.rightAnchor,paddingTop: 14.3,paddingLeft: 20,paddingBottom: 6, height: 18)

        
        return headerView
    }
    

    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.size.width, height: 18))
        headerView.backgroundColor = .systemGroupedBackground
        return headerView
    }
    
    
}

extension SettingsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if indexPath.section == SectionName.places.rawValue {
            self.delegate?.settingsViewControllerWantsToManagePlaces()
        } else if indexPath.section == SectionName.credits.rawValue {
            if indexPath.row == 1 {
                self.delegate?.settingsViewControllerWantsToContributors()
            }
        }
    }
}
