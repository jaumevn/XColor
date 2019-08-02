//
//  XColor.swift
//  XColor
//
//  Created by Jaume Viñas Navas on 02/08/2019.
//  Copyright © 2019 Jaume Viñas Navas. All rights reserved.
//

class XColor {
    
    private let color: UInt32
    
    init?(hexColor: String) {
        guard let str = XColor.sanitizedHexString(hexString: hexColor) else {
            return nil
        }
        
        guard let parsedColor = UInt32(str, radix: 16) else {
            return nil
        }
        
        color = parsedColor
    }
    
    init?(hexColor: UInt32) {
        color = hexColor
    }
    
    var red: UInt8 {
        return UInt8((color & 0xFF0000) >> 16)
    }
    
    var green: UInt8 {
        return UInt8((color & 0x00FF00) >> 8)
    }
    
    var blue: UInt8 {
        return UInt8(color & 0x0000FF)
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
        return s.count == 3 || s.count == 6
    }
}
