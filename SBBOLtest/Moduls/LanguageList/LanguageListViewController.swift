//
//  LanguageListViewController.swift
//  SBBOLtest
//
//  Created by Erik Vildanov on 30/05/2019.
//  Copyright (c) 2019 Erik Vildanov. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit

final class LanguageListViewController: UIViewController {

    // MARK: - Public properties -

    var presenter: LanguageListPresenterInterface!
    let languageListView = LanguageListView()

    // MARK: - Lifecycle -

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = languageListView
        presenter.viewDidLoad()
    }
	
}

// MARK: - Extensions -

extension LanguageListViewController: LanguageListViewInterface {
    func setTitle() {
        if presenter.isSourceLang() {
            self.title = "Source Language"
        } else {
            self.title = "Translate Language"
        }
    }
    
    @objc func closeController() {
        self.dismiss(animated: true, completion: nil)
    }
    
    func reloadTable() {
        languageListView.tableView.reloadData()
    }
    
    func setupView() {
        self.languageListView.tableView.register(LanguageCell.self, forCellReuseIdentifier: "LanguageCell")
        self.languageListView.tableView.delegate = self
        self.languageListView.tableView.dataSource = self
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(closeController))
    }
    
}

extension LanguageListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOrItems()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LanguageCell", for: indexPath) as! LanguageCell
        let item = presenter.item(at: indexPath)
        if item.language == presenter.getCurrentLanguage() {
            cell.backgroundColor = .lightGray
        }
        cell.configure(item: item)
        return cell
    }
}

extension LanguageListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.setSelectedLanduage(at: indexPath)
    }
}
