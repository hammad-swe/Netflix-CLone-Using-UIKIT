//
//  Extentions.swift
//  Netflix_Clone
//
//  Created by Hammad Ali on 31/03/2026.
//

import Foundation
extension String{
    func capitilizeFirstLetter() -> String{
        return self.prefix(1).uppercased() + self.lowercased().dropFirst()
    }
}
