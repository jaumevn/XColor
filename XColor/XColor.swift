//
//  XColor.swift
//  XColor
//
//  Created by Jaume Viñas Navas on 02/08/2019.
//  Copyright © 2019 Jaume Viñas Navas. All rights reserved.
//

import UIKit

struct Components {
    let red: UInt8
    let green: UInt8
    let blue: UInt8
    let alpha: Double
    
    init(red: UInt8, green: UInt8, blue: UInt8, alpha: Double = 1) {
        self.red = red
        self.green = green
        self.blue = blue
        self.alpha = alpha
    }
}

class XColor {
    
    private let color: UInt32
    private var alpha: Double = 1
    
    init?(hexColor: String) {
        guard let color = XColor.validatedColor(hexString: hexColor) else { return nil }
        self.color = color
    }
    
    init?(hexColor: Int) {
        self.color = UInt32(hexColor)
    }
    
    init?(hexColor: Int, alpha: Double) {
        self.color = UInt32(hexColor)
        self.alpha = alpha
    }

    init?(hexColor: String, alpha: Double) {
        guard let color = XColor.validatedColor(hexString: hexColor) else { return nil }
        self.color = color
        self.alpha = alpha
    }
    
    var components: Components? {
        if (0x000 ... 0xFFF ~= color) {
            let red = UInt8((color & 0xF00) >> 8)
            let green = UInt8((color & 0x0F0) >> 4)
            let blue = UInt8(color & 0x00F)
            return Components(red: red, green: green, blue: blue, alpha: alpha)
        } else if (0x000000 ... 0xFFFFFF ~= color) {
            let red = UInt8((color & 0xFF0000) >> 16)
            let green = UInt8((color & 0x00FF00) >> 8)
            let blue = UInt8(color & 0x0000FF)
            return Components(red: red, green: green, blue: blue, alpha: alpha)
        } else if (0x00000000 ... 0xFFFFFFFF ~= color) {
            let red = UInt8((color & 0xFF000000) >> 24)
            let green = UInt8((color & 0x00FF0000) >> 16)
            let blue = UInt8((color & 0x0000FF00) >> 8)
            let alpha = Double(UInt8(color & 0x000000FF)) / 255
            return Components(red: red, green: green, blue: blue, alpha: alpha)
        }
        
        return nil
    }
    
    private static func validatedColor(hexString: String) -> UInt32? {
        guard let str = XColor.sanitizedHexString(hexString: hexString) else {
            return nil
        }
        
        guard let color = UInt32(str, radix: 16) else {
            return nil
        }
        
        return color
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
