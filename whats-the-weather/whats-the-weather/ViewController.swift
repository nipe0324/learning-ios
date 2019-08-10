//
//  ViewController.swift
//  whats-the-weather
//
//  Created by yanagi on 2019/08/07.
//  Copyright © 2019 nipe0324. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var cityTextField: UITextField!
    @IBOutlet var resultLabel: UILabel!

    @IBAction func getWether(_ sender: Any) {
        
        if let url = URL(string: "https://www.weather-forecast.com/locations/" + cityTextField.text!.replacingOccurrences(of: " ", with: "-") + "/forecasts/latest") {
            let request = NSMutableURLRequest(url: url)
            let task = URLSession.shared.dataTask(with: request as URLRequest) {
                data, response, error in
                
                var message = ""
                
                if let error = error {
                    print(error)
                } else {
                    if let unwrappedData = data {
                        let dataString = NSString(data: unwrappedData, encoding: String.Encoding.utf8.rawValue)
                        var stringSeparator = "<p class=\"location-summary__text\"><span class=\"phrase\">"
                        
                        if let contentArray = dataString?.components(separatedBy:  stringSeparator) {
                            if contentArray.count > 0 {
                                stringSeparator = "</span>"
                                let newContentArray = contentArray[1].components(separatedBy: stringSeparator)
                                if newContentArray.count > 0 {
                                    message = newContentArray[0].replacingOccurrences(of: "&deg;", with: "°")
                                    print(message)
                                }
                            }
                        }
                    }
                }
                
                if message == "" {
                    message = "The weather there couldn't be found. Please try again."
                }
                
                DispatchQueue.main.sync(execute: {
                    self.resultLabel.text = message
                })
            }
            
            task.resume()
        } else {
            resultLabel.text = "The weather there couldn't be found. Please try again."
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }


}

