//
//  XColorTests.swift
//  XColorTests
//
//  Created by Jaume Viñas Navas on 02/08/2019.
//  Copyright © 2019 Jaume Viñas Navas. All rights reserved.
//

import XCTest
import CoreGraphics
@testable import XColor

class XColorTests: XCTestCase {
    func testShouldParseValidHexString() {
        // Given
        let hexString = "#FF2845"
        // When
        let color = XColor(hexColor: hexString)
        // Expect
        let components = color?.components
        XCTAssertEqual(components?.red, 0xFF)
        XCTAssertEqual(components?.green, 0x28)
        XCTAssertEqual(components?.blue, 0x45)
        XCTAssertEqual(components?.alpha, 0xFF)
    }
    
    func testShouldParseValidHexSmallString() {
        // Given
        let hexString = "#FA4"
        // When
        let color = XColor(hexColor: hexString)
        // Expect
        let components = color?.components
        XCTAssertEqual(components?.red, 0xF)
        XCTAssertEqual(components?.green, 0xA)
        XCTAssertEqual(components?.blue, 0x4)
        XCTAssertEqual(components?.alpha, 0xFF)
    }
    
    func testShouldParseValidHexAlphaString() {
        // Given
        let hexString = "#FA455588"
        // When
        let color = XColor(hexColor: hexString)
        // Expect
        let components = color?.components
        XCTAssertEqual(components?.red, 0xFA)
        XCTAssertEqual(components?.green, 0x45)
        XCTAssertEqual(components?.blue, 0x55)
        XCTAssertEqual(components?.alpha, 0x88)
    }
    
    func testShouldNotParseInalidHexStringCharacter() {
        // Given
        let hexString = "#FF284J"
        // When
        let color = XColor(hexColor: hexString)
        // Expect
        XCTAssertNil(color)
    }
    
    func testShouldNotParseInvalidHexPrefixString() {
        // Given
        let hexString = ".FF2845"
        // When
        let color = XColor(hexColor: hexString)
        // Expect
        XCTAssertNil(color)
    }
    
    func testShouldNotParseInvalidHexSizeString() {
        // Given
        let hexString = "#FF845"
        // When
        let color = XColor(hexColor: hexString)
        // Expect
        XCTAssertNil(color)
    }
}
