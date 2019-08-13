//
//  XColorTests.swift
//  XColorTests
//
//  Created by Jaume Viñas Navas on 02/08/2019.
//  Copyright © 2019 Jaume Viñas Navas. All rights reserved.
//

import XCTest
import CoreGraphics

#if os(iOS)
@testable import XColor_iOS
#elseif os(tvOS)
@testable import XColor_tvOS
#elseif os(macOS)
@testable import XColor_macOS
#endif

class XColorTests: XCTestCase {
    func testValidString() {
        // Given
        let hexString = "#FF2845"
        // When
        let color = XColor(hexColor: hexString)
        // Expect
        let components = color?.components
        XCTAssertEqual(components?.red, 0xFF)
        XCTAssertEqual(components?.green, 0x28)
        XCTAssertEqual(components?.blue, 0x45)
        XCTAssertEqual(components?.alpha, 1.0)
    }
    
    func testValidShortString() {
        // Given
        let hexString = "#FA4"
        // When
        let color = XColor(hexColor: hexString)
        // Expect
        let components = color?.components
        XCTAssertEqual(components?.red, 0xF)
        XCTAssertEqual(components?.green, 0xA)
        XCTAssertEqual(components?.blue, 0x4)
        XCTAssertEqual(components?.alpha, 1.0)
    }
    
    func testValidStringWithImplicitAlphaChannel() {
        // Given
        let hexString = "#FA455588"
        // When
        let color = XColor(hexColor: hexString)
        // Expect
        let components = color?.components
        XCTAssertEqual(components?.red, 0xFA)
        XCTAssertEqual(components?.green, 0x45)
        XCTAssertEqual(components?.blue, 0x55)
        XCTAssertEqual(components?.alpha, 0x88 / 255)
    }
    
    func testValidStringWithExplicitAlphaChannel() {
        // Given
        let hexString = "#FA4555"
        let alpha = 0.2
        // When
        let color = XColor(hexColor: hexString, alpha: alpha)
        // Expect
        let components = color?.components
        XCTAssertEqual(components?.red, 0xFA)
        XCTAssertEqual(components?.green, 0x45)
        XCTAssertEqual(components?.blue, 0x55)
        XCTAssertEqual(components?.alpha, 0.2)
    }
    
    func testInvalidHexStringCharacter() {
        // Given
        let hexString = "#FF284J"
        // When
        let color = XColor(hexColor: hexString)
        // Expect
        XCTAssertNil(color)
    }
    
    func testInvalidPrefixString() {
        // Given
        let hexString = ".FF2845"
        // When
        let color = XColor(hexColor: hexString)
        // Expect
        XCTAssertNil(color)
    }
    
    func testInvalidStringSize() {
        // Given
        let hexString = "#FF845"
        // When
        let color = XColor(hexColor: hexString)
        // Expect
        XCTAssertNil(color)
    }
    
    func testValidNumber() {
        // Given
        let hexNumber = 0xFF2845
        // When
        let color = XColor(hexColor: hexNumber)
        // Expect
        let components = color?.components
        XCTAssertEqual(components?.red, 0xFF)
        XCTAssertEqual(components?.green, 0x28)
        XCTAssertEqual(components?.blue, 0x45)
        XCTAssertEqual(components?.alpha, 1.0)
    }
    
    func testValidShortNumber() {
        // Given
        let hexNumber = 0xFA4
        // When
        let color = XColor(hexColor: hexNumber)
        // Expect
        let components = color?.components
        XCTAssertEqual(components?.red, 0xF)
        XCTAssertEqual(components?.green, 0xA)
        XCTAssertEqual(components?.blue, 0x4)
        XCTAssertEqual(components?.alpha, 1.0)
    }
    
    func testValidNumberWithImplicitAlphaChannel() {
        // Given
        let hexNumber = 0xFA455588
        // When
        let color = XColor(hexColor: hexNumber)
        // Expect
        let components = color?.components
        XCTAssertEqual(components?.red, 0xFA)
        XCTAssertEqual(components?.green, 0x45)
        XCTAssertEqual(components?.blue, 0x55)
        XCTAssertEqual(components?.alpha, 0x88 / 255)
    }
    
    func testValidNumberWithExplicitAlphaChannel() {
        // Given
        let hexNumber = 0xFA4555
        let alpha = 0.2
        // When
        let color = XColor(hexColor: hexNumber, alpha: alpha)
        // Expect
        let components = color?.components
        XCTAssertEqual(components?.red, 0xFA)
        XCTAssertEqual(components?.green, 0x45)
        XCTAssertEqual(components?.blue, 0x55)
        XCTAssertEqual(components?.alpha, 0.2)
    }
}
