//
//  TabBarInterfaces.swift
//  SBBOLtest
//
//  Created by Erik Vildanov on 30/05/2019.
//  Copyright (c) 2019 Erik Vildanov. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit

protocol TabBarWireframeInterface: WireframeInterface {
}

protocol TabBarViewInterface: ViewInterface {
    func setViewSontrollers()
    func removeAllHisory()
}

protocol TabBarPresenterInterface: PresenterInterface {
    func removeAllHistory()
}

protocol TabBarInteractorInterface: InteractorInterface {
}
