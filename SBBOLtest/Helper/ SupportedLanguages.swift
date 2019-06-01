//
//   SupportedLanguages.swift
//  SBBOLtest
//
//  Created by Erik Vildanov on 31/05/2019.
//  Copyright © 2019 Erik Vildanov. All rights reserved.
//

import Foundation

struct SupportedLanguages {
    var name: String? = nil
    var key: String? = nil
    
    init(_ dictionary: [String: Any]) {
        self.key = dictionary.keys.first
        self.name = dictionary.values.first as? String
    }
}

extension SupportedLanguages: LanguageItem {
    var language: String? {
        return name
    }
}
