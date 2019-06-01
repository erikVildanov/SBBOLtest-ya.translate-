//
//  TranslateInteractor.swift
//  SBBOLtest
//
//  Created by Erik Vildanov on 30/05/2019.
//  Copyright (c) 2019 Erik Vildanov. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import Foundation

final class TranslateInteractor {
}

// MARK: - Extensions -

extension TranslateInteractor: TranslateInteractorInterface {
    func getSourceLang() -> String {
        return UserDefaults.standard.getSourceLanduage()?.values.first ?? "Сhoose language"
    }
    
    func getTranslateLang() -> String {
        return UserDefaults.standard.getTranslateLanduage()?.values.first ?? "Сhoose language"
    }
    
    func getTranslateLangKey() -> String {
        let lang = (UserDefaults.standard.getSourceLanduage()?.keys.first)! + "-" + (UserDefaults.standard.getTranslateLanduage()?.keys.first)!
        return lang
    }
    
    func turnOverLang() {
        let copySourceLanduage = UserDefaults.standard.getSourceLanduage()!
        let translateLanduage = UserDefaults.standard.getTranslateLanduage()!
        UserDefaults.standard.setSourceLanduage(value: translateLanduage)
        UserDefaults.standard.setTranslateLanduage(value: copySourceLanduage)
    }
    
}
