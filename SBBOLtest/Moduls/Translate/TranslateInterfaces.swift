//
//  TranslateInterfaces.swift
//  SBBOLtest
//
//  Created by Erik Vildanov on 30/05/2019.
//  Copyright (c) 2019 Erik Vildanov. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit

enum TranslateNavigationOption {
    case openLangList(String, Bool)
}

protocol TranslateWireframeInterface: WireframeInterface {
    func navigate(to option: TranslateNavigationOption)
}

protocol TranslateViewInterface: ViewInterface {
    func openLanguageList(sender: UIButton)
    func setupTarget()
    func setTitleLangForBtn(source: String, translate: String)
    func turnOverLanguage()
    func closeKeyboard()
    func setTextOutput(text: String)
    func cleanText()
}

protocol TranslatePresenterInterface: PresenterInterface {
    func openLanguageList(lang: String, isSource: Bool)
    func turnOverLang()
    func getTranslationDirection() -> String
    func translateText(text: String)
}

protocol TranslateInteractorInterface: InteractorInterface {
    func getSourceLang() -> String
    func getTranslateLang() -> String
    func getTranslateLangKey() -> String
    func turnOverLang()
}
