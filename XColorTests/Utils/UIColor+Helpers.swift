//
//  UIColor+Helpers.swift
//  XColorTests
//
//  Created by Jaume Viñas Navas on 12/08/2019.
//  Copyright © 2019 Jaume Viñas Navas. All rights reserved.
//

import UIKit

extension UIColor {
    var rgba: (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        
        return (red, green, blue, alpha)
    }
}
