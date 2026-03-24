//
//  XColor.swift
//  XColor
//
//  Created by Jaume Viñas Navas on 02/08/2019.
//  Copyright © 2019 Jaume Viñas Navas. All rights reserved.
//

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

struct XColor {

    private let color: UInt32
    private let alpha: Double

    init?(hexColor: String) {
        guard let color = XColor.validatedColor(hexString: hexColor) else { return nil }
        self.color = color
        self.alpha = 1.0
    }

    init?(hexColor: String, alpha: Double) {
        guard let color = XColor.validatedColor(hexString: hexColor) else { return nil }
        self.color = color
        self.alpha = alpha
    }

    init?(hexColor: Int) {
        guard let color = UInt32(exactly: hexColor) else { return nil }
        self.color = color
        self.alpha = 1.0
    }

    init?(hexColor: Int, alpha: Double) {
        guard let color = UInt32(exactly: hexColor) else { return nil }
        self.color = color
        self.alpha = alpha
    }

    var components: Components? {
        if 0x000 ... 0xFFF ~= color {
            // 3-char shorthand: each nibble is doubled (e.g. #FA4 → #FFAA44)
            let rn = UInt8((color & 0xF00) >> 8)
            let gn = UInt8((color & 0x0F0) >> 4)
            let bn = UInt8(color & 0x00F)
            return Components(
                red: (rn << 4) | rn,
                green: (gn << 4) | gn,
                blue: (bn << 4) | bn,
                alpha: alpha
            )
        } else if 0x000000 ... 0xFFFFFF ~= color {
            let red = UInt8((color & 0xFF0000) >> 16)
            let green = UInt8((color & 0x00FF00) >> 8)
            let blue = UInt8(color & 0x0000FF)
            return Components(red: red, green: green, blue: blue, alpha: alpha)
        } else {
            // 8-char RGBA: last byte is implicit alpha
            let red = UInt8((color & 0xFF000000) >> 24)
            let green = UInt8((color & 0x00FF0000) >> 16)
            let blue = UInt8((color & 0x0000FF00) >> 8)
            let implicitAlpha = Double(color & 0x000000FF) / 255
            return Components(red: red, green: green, blue: blue, alpha: implicitAlpha)
        }
    }

    private static func validatedColor(hexString: String) -> UInt32? {
        var str = hexString
        if str.hasPrefix("#") {
            str.remove(at: str.startIndex)
        }
        guard str.count == 3 || str.count == 6 || str.count == 8 else { return nil }
        return UInt32(str, radix: 16)
    }
}
