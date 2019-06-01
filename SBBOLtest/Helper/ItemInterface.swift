//
//  ItemInterface.swift
//  SBBOLtest
//
//  Created by Erik Vildanov on 30/05/2019.
//  Copyright © 2019 Erik Vildanov. All rights reserved.
//

import Foundation

protocol LanguageItem {
    var language: String? { get }
}

protocol HistoryItem {
    var source: String? { get }
    var translateText: String? { get }
}
