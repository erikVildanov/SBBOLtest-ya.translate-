//
//  Extensions.swift
//  SBBOLtest
//
//  Created by Erik Vildanov on 01/06/2019.
//  Copyright © 2019 Erik Vildanov. All rights reserved.
//

import Foundation

enum UserDefaultsKeys: String {
    case sourceLanguage
    case translateLanguage
    case firstLaunch
}

extension UserDefaults {
    
    func setSourceLanduage(value: [String: String]) {
        set(value, forKey: UserDefaultsKeys.sourceLanguage.rawValue)
    }
    
    func getSourceLanduage() -> [String: String]? {
        return dictionary(forKey: UserDefaultsKeys.sourceLanguage.rawValue) as? [String: String]
    }
    
    func setTranslateLanduage(value: [String: String]) {
        set(value, forKey: UserDefaultsKeys.translateLanguage.rawValue)
    }
    
    func getTranslateLanduage() -> [String: String]? {
        return dictionary(forKey: UserDefaultsKeys.translateLanguage.rawValue) as? [String: String]
    }
    
    static func isFirstLaunch() -> Bool {
        let isFirstLaunch = !UserDefaults.standard.bool(forKey: UserDefaultsKeys.firstLaunch.rawValue)
        if isFirstLaunch {
            UserDefaults.standard.set(true, forKey: UserDefaultsKeys.firstLaunch.rawValue)
        }
        return isFirstLaunch
    }
    
}
