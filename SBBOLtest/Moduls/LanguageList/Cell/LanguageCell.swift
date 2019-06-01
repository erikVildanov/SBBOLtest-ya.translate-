//
//  LanguageCell.swift
//  SBBOLtest
//
//  Created by Erik Vildanov on 30/05/2019.
//  Copyright © 2019 Erik Vildanov. All rights reserved.
//

import UIKit

class LanguageCell: UITableViewCell {

    let label = UILabel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func initialize() {
        label.translatesAutoresizingMaskIntoConstraints = false
        addSubview(label)
        selectionStyle = .none
        
        addConstraint(NSLayoutConstraint(item: label, attribute: .bottom, relatedBy: .equal, toItem: self.safeAreaLayoutGuide, attribute: .bottom, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: label, attribute: .top, relatedBy: .equal, toItem: self.safeAreaLayoutGuide, attribute: .top, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: label, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: label, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1, constant: 20))
    }
    
    public func configure(item lang: LanguageItem) {
        initialize()
        self.label.text = lang.language
    }
    
    override func prepareForReuse() {
        self.label.text = nil
        backgroundColor = nil
    }

}
