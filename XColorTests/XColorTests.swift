//
//  XColorTests.swift
//  XColorTests
//
//  Created by Jaume Viñas Navas on 02/08/2019.
//  Copyright © 2019 Jaume Viñas Navas. All rights reserved.
//

import XCTest
@testable import XColor

class XColorTests: XCTestCase {
    func testShouldParseValidHexString() {
        // Given
        let hexString = "#FF2845"
        // When
        let color = XColor(hexColor: hexString)
        // Expect
        XCTAssertEqual(color?.red, 0xFF)
        XCTAssertEqual(color?.green, 0x28)
        XCTAssertEqual(color?.blue, 0x45)
    }
    func testShouldParseValidHexSmallString() {
        // Given
        let hexString = "#FA4"
        // When
        let color = XColor(hexColor: hexString)
        // Expect
        XCTAssertEqual(color?.red, 0xF)
        XCTAssertEqual(color?.green, 0xA)
        XCTAssertEqual(color?.blue, 0x4)
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
        let hexString = "XFF2845"
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
