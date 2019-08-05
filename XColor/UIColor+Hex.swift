//
//  XColor.swift
//  XColor
//
//  Created by Jaume Viñas Navas on 02/08/2019.
//  Copyright © 2019 Jaume Viñas Navas. All rights reserved.
//

import UIKit

extension UIColor {
    private convenience init?(xColor: XColor) {
        guard let components = xColor.components else { return nil }
        self.init(red: components.red / 255, green: components.green / 255, blue: components.blue / 255, alpha: components.alpha / 255)
    }
    
    convenience init?(hex: String) {
        guard let xc = XColor(hexColor: hex) else { return nil }
        self.init(xColor: xc)
    }
    
    convenience init?(hex: String, alpha: CGFloat) {
        guard let xc = XColor(hexColor: hex) else { return nil }
        self.init(xColor: xc)
    }
    
    convenience init?(hex: UInt32) {
        guard let xc = XColor(hexColor: hex) else { return nil }
        self.init(xColor: xc)
    }
    
    convenience init?(hex: UInt32, alpha: CGFloat) {
        guard let xc = XColor(hexColor: hex) else { return nil }
        self.init(xColor: xc)
    }
    
}
