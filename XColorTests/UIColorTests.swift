//
//  UIColorTest.swift
//  XColorTests
//
//  Created by Jaume Viñas Navas on 12/08/2019.
//  Copyright © 2019 Jaume Viñas Navas. All rights reserved.
//

import XCTest
import UIKit
@testable import XColor

class UIColorTests: XCTestCase {
    func testColorWithString() {
        // GIVEN
        let hex = "#AC34CF"
        
        // WHEN
        let color = UIColor(hex)
        
        // EXPECT
        let components = color?.rgba
        
        XCTAssertEqual(color?.cgColor.numberOfComponents, 4 , "Color should have three color components and alpha channel")
        XCTAssertEqual(components?.red, 0xAC / 255 , "Red component should be 0xAC")
        XCTAssertEqual(components?.green, 0x34 / 255 , "Green component should be 0x34")
        XCTAssertEqual(components?.blue, 0xCF / 255 , "Blue component should be 0xCF")
        XCTAssertEqual(components?.alpha, 0xFF / 255 , "Alpha component should be 0xAC")
    }
    
    func testColorWithStringAndImplicitAlphaChannel() {
        // GIVEN
        let hex = "#AC34CF88"
        
        // WHEN
        let color = UIColor(hex)
        
        // EXPECT
        let components = color?.rgba
        
        XCTAssertEqual(color?.cgColor.numberOfComponents, 4 , "Color should have three color components and alpha channel")
        XCTAssertEqual(components?.red, 0xAC / 255 , "Red component should be 0xAC")
        XCTAssertEqual(components?.green, 0x34 / 255 , "Green component should be 0x34")
        XCTAssertEqual(components?.blue, 0xCF / 255 , "Blue component should be 0xCF")
        XCTAssertEqual(components?.alpha, 0x88 / 255 , "Alpha component should be 0x88")
    }
    
    func testColorWithStringAndExplicitAlphaChannel() {
        // GIVEN
        let hex = "#AC34CF"
        let alpha = 0.3
        
        // WHEN
        let color = UIColor(hex, alpha: alpha)
        
        // EXPECT
        let components = color?.rgba
        
        XCTAssertEqual(color?.cgColor.numberOfComponents, 4 , "Color should have three color components and alpha channel")
        XCTAssertEqual(components?.red, 0xAC / 255 , "Red component should be 0xAC")
        XCTAssertEqual(components?.green, 0x34 / 255 , "Green component should be 0x34")
        XCTAssertEqual(components?.blue, 0xCF / 255 , "Blue component should be 0xCF")
        XCTAssertEqual(components?.alpha, 0.3 , "Alpha component should be 0x88")
    }
    
    func testColorWithNumber() {
        // GIVEN
        let hex = 0xAC34CF
        
        // WHEN
        let color = UIColor(hex)
        
        // EXPECT
        let components = color?.rgba
        
        XCTAssertEqual(color?.cgColor.numberOfComponents, 4 , "Color should have three color components and alpha channel")
        XCTAssertEqual(components?.red, 0xAC / 255 , "Red component should be 0xAC")
        XCTAssertEqual(components?.green, 0x34 / 255 , "Green component should be 0x34")
        XCTAssertEqual(components?.blue, 0xCF / 255 , "Blue component should be 0xCF")
        XCTAssertEqual(components?.alpha, 0xFF / 255 , "Alpha component should be 0x88")
    }
    
    func testColorWithNumberAndImplicitAlphaChannel() {
        // GIVEN
        let hex = 0xAC34CF88
        
        // WHEN
        let color = UIColor(hex)
        
        // EXPECT
        let components = color?.rgba
        
        XCTAssertEqual(color?.cgColor.numberOfComponents, 4 , "Color should have three color components and alpha channel")
        XCTAssertEqual(components?.red, 0xAC / 255 , "Red component should be 0xAC")
        XCTAssertEqual(components?.green, 0x34 / 255 , "Green component should be 0x34")
        XCTAssertEqual(components?.blue, 0xCF / 255 , "Blue component should be 0xCF")
        XCTAssertEqual(components?.alpha, 0x88 / 255 , "Alpha component should be 0x88")
    }
    
    func testColorWithNumberAndExplicitAlphaChannel() {
        // GIVEN
        let hex = 0xAC34CF
        let alpha = 0.3
        
        // WHEN
        let color = UIColor(hex, alpha: alpha)
        
        // EXPECT
        let components = color?.rgba
        
        XCTAssertEqual(color?.cgColor.numberOfComponents, 4 , "Color should have three color components and alpha channel")
        XCTAssertEqual(components?.red, 0xAC / 255 , "Red component should be 0xAC")
        XCTAssertEqual(components?.green, 0x34 / 255 , "Green component should be 0x34")
        XCTAssertEqual(components?.blue, 0xCF / 255 , "Blue component should be 0xCF")
        XCTAssertEqual(components?.alpha, 0.3 , "Alpha component should be 0x88")
    }
    
    func testColorWithInvalidString() {
        // GIVEN
        let hex = ".This is an invalid string!"
        
        // WHEN
        let color = UIColor(hex)
        
        // EXPECT
        XCTAssertNil(color)
    }
}
