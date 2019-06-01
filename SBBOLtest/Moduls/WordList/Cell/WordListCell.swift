//
//  WordListCell.swift
//  SBBOLtest
//
//  Created by Erik Vildanov on 01/06/2019.
//  Copyright © 2019 Erik Vildanov. All rights reserved.
//

import UIKit

class WordListCell: UITableViewCell {
    
    let sourceText = UILabel()
    let translateText = UILabel()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func initialize() {
        sourceText.translatesAutoresizingMaskIntoConstraints = false
        translateText.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(sourceText)
        addSubview(translateText)
        
        addConstraint(NSLayoutConstraint(item: sourceText, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: sourceText, attribute: .leading, relatedBy: .equal, toItem: self.safeAreaLayoutGuide, attribute: .leading, multiplier: 1, constant: 15))
        addConstraint(NSLayoutConstraint(item: sourceText, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: sourceText, attribute: .trailing, relatedBy: .equal, toItem: translateText, attribute: .leading, multiplier: 1, constant: -10))
        addConstraint(NSLayoutConstraint(item: translateText, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: translateText, attribute: .trailing, relatedBy: .equal, toItem: self.safeAreaLayoutGuide, attribute: .trailing, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: translateText, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: sourceText, attribute: .width, relatedBy: .equal, toItem: translateText, attribute: .width, multiplier: 1, constant: 0))
    }
    
    public func configure(item lang: HistoryItem) {
        initialize()
        sourceText.text = lang.source
        translateText.text = lang.translateText
    }
    
    override func prepareForReuse() {
        sourceText.text = nil
        translateText.text = nil
    }

}
