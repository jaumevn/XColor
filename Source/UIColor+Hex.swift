//
//  XColor.swift
//  XColor
//
//  Created by Jaume Viñas Navas on 02/08/2019.
//  Copyright © 2019 Jaume Viñas Navas. All rights reserved.
//

#if os(macOS)
import Cocoa
typealias OSColor = NSColor
#else
import UIKit
typealias OSColor = UIColor
#endif

extension OSColor {
    private convenience init?(xColor: XColor) {
        guard let components = xColor.components else { return nil }
        self.init(red: CGFloat(components.red) / 255, green: CGFloat(components.green) / 255, blue: CGFloat(components.blue) / 255, alpha: CGFloat(components.alpha))
    }
    
    public convenience init?(_ hex: String) {
        guard let xc = XColor(hexColor: hex) else { return nil }
        self.init(xColor: xc)
    }
    
    public convenience init?(_ hex: String, alpha: Double) {
        guard let xc = XColor(hexColor: hex, alpha: alpha) else { return nil }
        self.init(xColor: xc)
    }
    
    public convenience init?(_ hex: Int) {
        guard let xc = XColor(hexColor: hex) else { return nil }
        self.init(xColor: xc)
    }
    
    public convenience init?(_ hex: Int, alpha: Double) {
        guard let xc = XColor(hexColor: hex, alpha: alpha) else { return nil }
        self.init(xColor: xc)
    }
    
}
