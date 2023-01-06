//
//  VC + alertController.swift
//  TheWeather
//
//  Created by Никита Бурин on 30.12.2022.
//

import UIKit

extension ViewController {
    func presentSearchAlertController(title: String?, message: String?, style: UIAlertController.Style, comletionHandler: @escaping (String) -> Void){
        let alertController = UIAlertController(title: title, message: message, preferredStyle: style)
        alertController.addTextField {textField in
            textField.placeholder = "example: Moscow"
        }
        let search = UIAlertAction(title: "Search", style: .default) { action in
            let textField = alertController.textFields?.first
            guard let cityName = textField?.text else {return}
            if cityName != "" {
                let city = cityName.split(separator: " ").joined(separator: "%20")
                comletionHandler(city)
            }
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(search)
        alertController.addAction(cancel)
        present(alertController, animated: true, completion: nil)
    }
}
