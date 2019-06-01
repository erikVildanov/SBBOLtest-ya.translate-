//
//  WordListView.swift
//  SBBOLtest
//
//  Created by Erik Vildanov on 30/05/2019.
//  Copyright © 2019 Erik Vildanov. All rights reserved.
//

import UIKit

class WordListView: UIView {
    
    let searchBar = UISearchBar()
    let tableView = UITableView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initializeView()
    }
    
    convenience init() {
        self.init(frame: CGRect.zero)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initializeView() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        addSubview(searchBar)
        addSubview(tableView)
        
        searchBar.placeholder = "Search word"
        searchBar.barTintColor = .orange

        addConstraint(NSLayoutConstraint(item: searchBar, attribute: .top, relatedBy: .equal, toItem: self.safeAreaLayoutGuide, attribute: .top, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: searchBar, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: searchBar, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: searchBar, attribute: .bottom, relatedBy: .equal, toItem: tableView, attribute: .top, multiplier: 1, constant: 0))
        
        addConstraint(NSLayoutConstraint(item: tableView, attribute: .bottom, relatedBy: .equal, toItem: self.safeAreaLayoutGuide, attribute: .bottom, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: tableView, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: tableView, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1, constant: 0))
    }
    
}
