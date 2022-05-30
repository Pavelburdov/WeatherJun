//
//  AddCity.swift
//  WeatherTestJunior
//
//  Created by Pavel on 26.05.2022.
//

import UIKit

extension UIViewController {

    func allertPlusCity(name: String, placeholder: String, completionHandler: @escaping(String) -> Void) {
        let allert = UIAlertController(title: name, message: nil, preferredStyle: .alert)
        let allertOk = UIAlertAction(title: "Ok", style: .default) { (action) in
            let tftext = allert.textFields?.first
            guard let text = tftext?.text else { return }
            completionHandler(text)
        }

        allert.addTextField() { (tf) in
            tf.placeholder = placeholder
        }

        let allertCancel = UIAlertAction(title: "Cancel", style: .default) { (_) in }
        allert.addAction(allertOk)
        allert.addAction(allertCancel)

        present(allert, animated: true, completion: nil)
    }
}
