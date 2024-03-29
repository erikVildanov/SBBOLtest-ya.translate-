//
//  TranslateViewController.swift
//  SBBOLtest
//
//  Created by Erik Vildanov on 30/05/2019.
//  Copyright (c) 2019 Erik Vildanov. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit

final class TranslateViewController: UIViewController {

    // MARK: - Public properties -

    var presenter: TranslatePresenterInterface!
    let translateView = TranslateView()
    // MARK: - Lifecycle -

    override func viewDidLoad() {
        super.viewDidLoad()
        view = translateView
        presenter.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.viewWillAppear(animated: animated)
    }
}

// MARK: - Extensions -

extension TranslateViewController: TranslateViewInterface {
    func setTitleLangForBtn(source: String, translate: String) {
        translateView.sourceLangBtn.setTitle(source, for: .normal)
        translateView.translateLangBtn.setTitle(translate, for: .normal)
    }
    
    func setupTarget() {
        translateView.inputText.delegate = self
        translateView.sourceLangBtn.addTarget(self, action: #selector(openLanguageList(sender:)), for: .touchUpInside)
        translateView.translateLangBtn.addTarget(self, action: #selector(openLanguageList(sender:)), for: .touchUpInside)
        translateView.turnOverLabgBtn.addTarget(self, action: #selector(turnOverLanguage), for: .touchUpInside)
        let gesture = UITapGestureRecognizer(target: self, action: #selector(closeKeyboard))
        self.view.addGestureRecognizer(gesture)
    }
    
    @objc func openLanguageList(sender: UIButton) {
        presenter.openLanguageList(lang: sender.currentTitle!, isSource: sender == translateView.sourceLangBtn)
    }
    
    @objc func turnOverLanguage() {
        presenter.turnOverLang()
        guard let text = translateView.outputText.text else { return }
        translateView.inputText.text = text
        presenter.translateText(text: text)
    }
    
    @objc func closeKeyboard() {
        self.view.endEditing(true)
    }
    
    func setTextOutput(text: String) {
        self.translateView.outputText.text = text
    }
    
    func cleanText() {
        self.translateView.inputText.text = ""
        self.translateView.outputText.text = ""
    }
}

extension TranslateViewController: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        guard let text = textView.text else { return }
        if text == "" { self.setTextOutput(text: "") }
        DispatchQueue.global(qos: .userInteractive).async {
            self.presenter.translateText(text: text)
        }
    }
}
