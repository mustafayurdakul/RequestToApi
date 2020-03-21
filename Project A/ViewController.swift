//
//  ViewController.swift
//  Project A
//
//  Created by Mustafa Yurdakul on 21.03.2020.
//  Copyright © 2020 Mustafa Yurdakul. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func sendRequest(_ sender: Any) {
        let restEndPoint: String = "api.url - here"
        // Put API URL here.
        
        guard let url = URL(string: restEndPoint) else {
            print("Error - creating URL")
            return
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "PUT"
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        // You can add to urlRequest additional value like API Key.
        
        let jsonDictionary = NSMutableDictionary()
        jsonDictionary.setValue("123", forKey: "ID")
        jsonDictionary.setValue("123", forKey: "keyName - 1")
        jsonDictionary.setValue("123", forKey: "keyName - 2")
        jsonDictionary.setValue("123", forKey: "keyName - 3")
        // Creating JSON dictionary and add keys.
        
        
        let jsonData: Data
        
        do {
            jsonData = try JSONSerialization.data(withJSONObject: jsonDictionary, options: JSONSerialization.WritingOptions())
            urlRequest.httpBody = jsonData
            
        } catch {
            print("Error - creating JSON")
            return
        }
        
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        
        let task = session.dataTask(with: urlRequest, completionHandler: {
            (data: Data?, response: URLResponse?, error: Error?) in
            print("Error - \(String(describing: error))")
            print("Response - \(String(describing: response))")
            print("Data - \(String(describing: String(data: data!, encoding: String.Encoding.utf8)))")
        })
        
        task.resume()
    }
}
