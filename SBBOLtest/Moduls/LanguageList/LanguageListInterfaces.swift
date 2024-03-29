//
//  LanguageListInterfaces.swift
//  SBBOLtest
//
//  Created by Erik Vildanov on 30/05/2019.
//  Copyright (c) 2019 Erik Vildanov. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit

enum LanguageListNavigationOption {
    case close
}

protocol LanguageListWireframeInterface: WireframeInterface {
    func navigate(to option: LanguageListNavigationOption)
}

protocol LanguageListViewInterface: ViewInterface {
    func setupView()
    func reloadTable()
    func closeController()
    func setTitle()
}

protocol LanguageListPresenterInterface: PresenterInterface {
    func numberOrItems() -> Int
    func item(at indexPath: IndexPath) -> LanguageItem
    func getCurrentLanguage() -> String
    func setSelectedLanduage(at indexPath: IndexPath)
    func isSourceLang() -> Bool
}

protocol LanguageListInteractorInterface: InteractorInterface {
    func getLanguageList(completionHandler: @escaping (_ responseString: [SupportedLanguages]) -> ())
}
