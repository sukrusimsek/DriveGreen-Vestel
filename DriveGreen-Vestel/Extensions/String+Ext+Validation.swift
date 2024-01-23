//
//  String+Ext+Validation.swift
//  DriveGreen-Vestel
//
//  Created by Şükrü Şimşek on 23.01.2024.
//

import Foundation

extension Optional where Wrapped == String {
    func isEmailValid() -> Bool{
        guard let email = self else { return false }
        let emailPattern = "[A-Za-z-0-9.-_]+@[A-Za-z0-9]+\\.[A-Za-z]{2,3}"
        do{
            let regex = try NSRegularExpression(pattern: emailPattern, options: .caseInsensitive)
            let foundPatters = regex.numberOfMatches(in: email, options: .anchored, range: NSRange(location: 0, length: email.count))
            if foundPatters > 0 {
                return true
            }
        } catch {
            //error
        }
        return false
    }
}
