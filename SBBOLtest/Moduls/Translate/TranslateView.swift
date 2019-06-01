//
//  TranslateView.swift
//  SBBOLtest
//
//  Created by Erik Vildanov on 30/05/2019.
//  Copyright © 2019 Erik Vildanov. All rights reserved.
//

import UIKit

class TranslateView: UIView {
    let sourceLangBtn = UIButton()
    let translateLangBtn = UIButton()
    let turnOverLabgBtn = UIButton()
    private let backView = UIView()
    let inputText = UITextView()
    let outputText = UITextView()
    private let lineView = UIView()
    
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
        backgroundColor = .orange
        sourceLangBtn.translatesAutoresizingMaskIntoConstraints = false
        translateLangBtn.translatesAutoresizingMaskIntoConstraints = false
        turnOverLabgBtn.translatesAutoresizingMaskIntoConstraints = false
        backView.translatesAutoresizingMaskIntoConstraints = false
        inputText.translatesAutoresizingMaskIntoConstraints = false
        outputText.translatesAutoresizingMaskIntoConstraints = false
        lineView.translatesAutoresizingMaskIntoConstraints = false
        
        backView.layer.cornerRadius = 10
        backView.clipsToBounds = true
        lineView.backgroundColor = .gray
        backView.backgroundColor = .white
        sourceLangBtn.setTitle("sourceLangBtn", for: .normal)
        translateLangBtn.setTitle("translateLangBtn", for: .normal)
        sourceLangBtn.setTitleColor(.black, for: .normal)
        translateLangBtn.setTitleColor(.black, for: .normal)
        turnOverLabgBtn.setImage(UIImage(named: "arrow"), for: .normal)
        outputText.isEditable = false
        
        addSubview(sourceLangBtn)
        addSubview(translateLangBtn)
        addSubview(turnOverLabgBtn)
        addSubview(backView)
        backView.addSubview(inputText)
        backView.addSubview(lineView)
        backView.addSubview(outputText)
        
        addConstraint(NSLayoutConstraint(item: sourceLangBtn, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 10))
        addConstraint(NSLayoutConstraint(item: sourceLangBtn, attribute: .leading, relatedBy: .greaterThanOrEqual, toItem: self, attribute: .leading, multiplier: 1, constant: 10))
        addConstraint(NSLayoutConstraint(item: sourceLangBtn, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 40))
        addConstraint(NSLayoutConstraint(item: sourceLangBtn, attribute: .trailing, relatedBy: .equal, toItem: turnOverLabgBtn, attribute: .leading, multiplier: 1, constant: -20))
        
        addConstraint(NSLayoutConstraint(item: turnOverLabgBtn, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: turnOverLabgBtn, attribute: .centerY, relatedBy: .equal, toItem: sourceLangBtn, attribute: .centerY, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: turnOverLabgBtn, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 30))
        
        addConstraint(NSLayoutConstraint(item: translateLangBtn, attribute: .leading, relatedBy: .equal, toItem: turnOverLabgBtn, attribute: .trailing, multiplier: 1, constant: 20))
        addConstraint(NSLayoutConstraint(item: translateLangBtn, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 10))
        addConstraint(NSLayoutConstraint(item: translateLangBtn, attribute: .trailing, relatedBy: .lessThanOrEqual, toItem: self, attribute: .trailing, multiplier: 1, constant: 10))
        addConstraint(NSLayoutConstraint(item: translateLangBtn, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 40))
        
        addConstraint(NSLayoutConstraint(item: backView, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1, constant: -10))
        addConstraint(NSLayoutConstraint(item: backView, attribute: .top, relatedBy: .equal, toItem: sourceLangBtn, attribute: .bottom, multiplier: 1, constant: 10))
        addConstraint(NSLayoutConstraint(item: backView, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1, constant: -10))
        addConstraint(NSLayoutConstraint(item: backView, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1, constant: 10))
        
        addConstraint(NSLayoutConstraint(item: inputText, attribute: .top, relatedBy: .equal, toItem: backView, attribute: .top, multiplier: 1, constant: 10))
        addConstraint(NSLayoutConstraint(item: inputText, attribute: .leading, relatedBy: .equal, toItem: backView, attribute: .leading, multiplier: 1, constant: 10))
        addConstraint(NSLayoutConstraint(item: inputText, attribute: .trailing, relatedBy: .equal, toItem: backView, attribute: .trailing, multiplier: 1, constant: -10))
        addConstraint(NSLayoutConstraint(item: inputText, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 150))
        
        addConstraint(NSLayoutConstraint(item: lineView, attribute: .top, relatedBy: .equal, toItem: inputText, attribute: .bottom, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: lineView, attribute: .leading, relatedBy: .equal, toItem: backView, attribute: .leading, multiplier: 1, constant: 10))
        addConstraint(NSLayoutConstraint(item: lineView, attribute: .trailing, relatedBy: .equal, toItem: backView, attribute: .trailing, multiplier: 1, constant: -10))
        addConstraint(NSLayoutConstraint(item: lineView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 1))
        
        addConstraint(NSLayoutConstraint(item: outputText, attribute: .top, relatedBy: .equal, toItem: lineView, attribute: .bottom, multiplier: 1, constant: 10))
        addConstraint(NSLayoutConstraint(item: outputText, attribute: .leading, relatedBy: .equal, toItem: backView, attribute: .leading, multiplier: 1, constant: 10))
        addConstraint(NSLayoutConstraint(item: outputText, attribute: .trailing, relatedBy: .equal, toItem: backView, attribute: .trailing, multiplier: 1, constant: -10))
        addConstraint(NSLayoutConstraint(item: outputText, attribute: .bottom, relatedBy: .equal, toItem: backView, attribute: .bottom, multiplier: 1, constant: -10))
        
    }
    
}
