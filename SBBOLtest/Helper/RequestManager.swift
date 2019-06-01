//
//  File.swift
//  SBBOLtest
//
//  Created by Erik Vildanov on 30/05/2019.
//  Copyright © 2019 Erik Vildanov. All rights reserved.
//

import Foundation

class RequestManager {
    static let sharedInsance = RequestManager()
    private let apiKey = "trnsl.1.1.20190530T151045Z.34cc1346d4144c48.80aa1f059a23d6ba97ea66add036e921ee13442a"
    private var supportedLanguages: [SupportedLanguages]!
    init() {
    }
    
    private func getRequest(url: String, completionHandler: @escaping (_ jsonResponse: [[String: Any]]?, _ code: Int?, _ error: Error?) -> ()) {
        guard let url = URL(string: url) else { return }
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completionHandler(nil, nil , error)
            } else {
                if let data = data, let response = response as? HTTPURLResponse  {
                    do {
                        let jsonResponse = try JSONSerialization.jsonObject(with: data, options: [])
                        guard let jsonArray = jsonResponse as? [[String: Any]] else { return }
                        completionHandler(jsonArray, response.statusCode, nil)
                    } catch {
                        print(error.localizedDescription)
                    }
                    
                }
            }
        }
        task.resume()
    }
    
    private func postDataAsynchronous(url: String, body: String = "", completionHandler: @escaping (_ jsonResponse: [String: Any]?, _ code: Int?, _ error: Error?) -> ()) {
        guard let url: URL = URL(string: url) else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = body.data(using: .utf8)
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print("error: \(error)")
            } else {
                if let data = data, let response = response as? HTTPURLResponse  {
                    do {
                        let jsonResponse = try JSONSerialization.jsonObject(with: data, options: [])
                        guard let jsonArray = jsonResponse as? [String: Any] else {
                            return
                        }
                        completionHandler(jsonArray, response.statusCode, nil)
                    } catch {
                        print(error.localizedDescription)
                    }
                    
                }
            }
        }
        task.resume()
    }
    
    func getSupportedLanguages(completionHandler: @escaping (_ responseString: [SupportedLanguages]) -> ()) {
        guard supportedLanguages == nil else { completionHandler(self.supportedLanguages); return}
        postDataAsynchronous(url: "https://translate.yandex.net/api/v1.5/tr.json/getLangs?ui=en&key=\(apiKey)") { (jsonArray, code, _) in
            self.supportedLanguages = [SupportedLanguages]() //Initialising Model Array
            for dic in jsonArray!["langs"] as! [String: Any] {
                self.supportedLanguages.append(SupportedLanguages([dic.key: dic.value])) // adding now value in Model array
            }
            completionHandler(self.supportedLanguages)
        }
    }
    
    func translate(text: String, lang: String,completionHandler: @escaping (_ translateStr: String, _ code: Int) -> () ) {
        postDataAsynchronous(url: "https://translate.yandex.net/api/v1.5/tr.json/translate?lang=\(lang)&key=\(apiKey)", body: "text=\(text)") { (json, code, _) in
            guard let text = json!["text"] as? [String] else { return }
            guard let code = code else { return }
            completionHandler(text.first!, code)
        }
    }
    
}
