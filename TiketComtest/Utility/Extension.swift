//
//  Extension.swift
//  TiketComtest
//
//  Created by reza pahlevi on 01/02/21.
//

import Foundation

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
