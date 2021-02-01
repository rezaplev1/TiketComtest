//
//  Extension.swift
//  TiketComtest
//
//  Created by reza pahlevi on 01/02/21.
//

import UIKit

extension Double {
    
    var clean: String {
        let formatter = NumberFormatter()
        formatter.groupingSeparator = "."
        formatter.numberStyle = .decimal
        let value = Double(self)
        let stringValue = formatter.string(from: NSNumber(value: value )) ?? "0"
        return stringValue
    }
    
}

extension UIViewController {
    
    func simpleAlert(message: String, title: String = "") {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(OKAction)
        present(alertController, animated: true, completion: nil)
    }
}
