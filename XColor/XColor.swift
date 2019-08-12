//
//  XColor.swift
//  XColor
//
//  Created by Jaume Viñas Navas on 02/08/2019.
//  Copyright © 2019 Jaume Viñas Navas. All rights reserved.
//

import UIKit

struct Components {
    let red: CGFloat
    let green: CGFloat
    let blue: CGFloat
    let alpha: CGFloat
    
    init(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat = 1) {
        self.red = red
        self.green = green
        self.blue = blue
        self.alpha = alpha
    }
}

class XColor {
    
    private let color: UInt32
    private var alpha: CGFloat = 1
    
    init?(hexColor: String) {
        guard let str = XColor.sanitizedHexString(hexString: hexColor) else {
            return nil
        }
        
        guard let color = UInt32(str, radix: 16) else {
            return nil
        }
        
        self.color = color
    }
    
    init?(hexColor: UInt32) {
        self.color = hexColor
    }
    
    init?(hexColor: UInt32, alpha: CGFloat) {
        self.color = hexColor
        self.alpha = alpha
    }
    
    init?(hexColor: String, alpha: CGFloat) {
        guard let str = XColor.sanitizedHexString(hexString: hexColor) else {
            return nil
        }
        
        guard let color = UInt32(str, radix: 16) else {
            return nil
        }

        self.color = color
        self.alpha = alpha
    }
    
    var components: Components? {
        if (0x000 ... 0xFFF ~= color) {
            let red = CGFloat((color & 0xF00) >> 8)
            let green = CGFloat((color & 0x0F0) >> 4)
            let blue = CGFloat(color & 0x00F)
            return Components(red: red, green: green, blue: blue, alpha: alpha)
        } else if (0x000000 ... 0xFFFFFF ~= color) {
            let red = CGFloat((color & 0xFF0000) >> 16)
            let green = CGFloat((color & 0x00FF00) >> 8)
            let blue = CGFloat(color & 0x0000FF)
            return Components(red: red, green: green, blue: blue, alpha: alpha)
        } else if (0x00000000 ... 0xFFFFFFFF ~= color) {
            let red = CGFloat((color & 0xFF000000) >> 24)
            let green = CGFloat((color & 0x00FF0000) >> 16)
            let blue = CGFloat((color & 0x0000FF00) >> 8)
            let alpha = CGFloat(color & 0x000000FF) / 255
            return Components(red: red, green: green, blue: blue, alpha: alpha)
        }
        
        return nil
    }

    private static func sanitizedHexString(hexString: String) -> String? {
    
        var str = hexString
        
        if (str.hasPrefix("#")) {
            str.remove(at: str.startIndex)
        }
        
        if (!valid(str)) {
            return nil
        }
        
        return str
    }
    
    private static func valid(_ s: String) -> Bool {
        return s.count == 3 || s.count == 6 || s.count == 8
    }
}
