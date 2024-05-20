//
//  StringExtension.swift
//  LoginLo
//
//  Created by Maksims Šalajevs on 20/05/2024.
//

import Foundation
extension String {
    var localized: String {
        NSLocalizedString(self, comment: "")
    }
}
