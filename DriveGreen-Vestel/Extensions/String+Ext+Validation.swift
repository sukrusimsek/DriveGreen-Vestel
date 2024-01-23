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
    func isPasswordValid(_ password: String) -> Bool {
        // have to min 8 chars in pass
        guard password.count >= 8 else {
            return false
        }
        // Uppercased control
        let uppercaseLetterRegex = ".*[A-Z]+.*"
        let uppercaseLetterTest = NSPredicate(format:"SELF MATCHES %@", uppercaseLetterRegex)
        guard uppercaseLetterTest.evaluate(with: password) else {
            return false
        }
        // Special char control
        let specialCharacterRegex = ".*[^A-Za-z0-9]+.*"
        let specialCharacterTest = NSPredicate(format:"SELF MATCHES %@", specialCharacterRegex)
        guard specialCharacterTest.evaluate(with: password) else {
            return false
        }
        
        // If passed the all control. The pass is good pass.
        return true
    }
}
