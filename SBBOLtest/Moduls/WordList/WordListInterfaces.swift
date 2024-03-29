//
//  WordListInterfaces.swift
//  SBBOLtest
//
//  Created by Erik Vildanov on 30/05/2019.
//  Copyright (c) 2019 Erik Vildanov. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit

protocol WordListWireframeInterface: WireframeInterface {
}

protocol WordListViewInterface: ViewInterface {
    func setupView()
    func closeKEyboard()
    func reloadTableView()
    func isFiltering() -> Bool
}

protocol WordListPresenterInterface: PresenterInterface {
    func numberOrItems() -> Int
    func item(at indexPath: IndexPath) -> HistoryItem
    func removeItem(at indexPath: IndexPath)
    func itemFilter(at indexPath: IndexPath) -> HistoryItem
    func setFilter(text: String)
}

protocol WordListInteractorInterface: InteractorInterface {
    func getAllHistory() -> [History]
    func getFilterHistory(searchText: String) -> [History]
}
