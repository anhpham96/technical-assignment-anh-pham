//
//  String+Extenstions.swift
//  TechnicalAssignment
//
//  Created by Pham Nguyen Nhat Anh on 27/3/25.
//


import Foundation

extension String {
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }

    func localized(with arguments: CVarArg...) -> String {
        return String(format: self.localized, arguments: arguments)
    }
}
