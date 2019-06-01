//
//  TranslatePresenter.swift
//  SBBOLtest
//
//  Created by Erik Vildanov on 30/05/2019.
//  Copyright (c) 2019 Erik Vildanov. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit

final class TranslatePresenter {

    // MARK: - Private properties -

    private unowned let view: TranslateViewInterface
    private let interactor: TranslateInteractorInterface
    private let wireframe: TranslateWireframeInterface

    // MARK: - Lifecycle -

    init(view: TranslateViewInterface, interactor: TranslateInteractorInterface, wireframe: TranslateWireframeInterface) {
        self.view = view
        self.interactor = interactor
        self.wireframe = wireframe
    }
    
    func viewDidLoad() {
        view.setupTarget()
    }
    
    func viewWillAppear(animated: Bool) {
        view.setTitleLangForBtn(source: interactor.getSourceLang(), translate: interactor.getTranslateLang())
        view.cleanText()
    }
}

// MARK: - Extensions -

extension TranslatePresenter: TranslatePresenterInterface {
    func turnOverLang() {
        interactor.turnOverLang()
        view.setTitleLangForBtn(source: interactor.getSourceLang(), translate: interactor.getTranslateLang())
    }
    
    func openLanguageList(lang: String, isSource: Bool) {
        wireframe.navigate(to: .openLangList(lang, isSource))
    }
    
    func getTranslationDirection() -> String {
        return interactor.getTranslateLangKey()
    }
    
    func translateText(text: String) {
        RequestManager.sharedInsance.translate(text: text, lang: getTranslationDirection()) { (translateText, code) in
            guard code == 200 else { return }
            DispatchQueue.global(qos: .default).async {
                _ = CoreDataManager.sharedInstance.insertItem(source: text, translate: translateText)
            }
            DispatchQueue.main.async {
                self.view.setTextOutput(text: translateText)
            }
        }
    }
}