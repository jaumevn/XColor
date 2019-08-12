![Travis (.com)](https://img.shields.io/travis/com/jaumevn/XColor) ![Codecov](https://img.shields.io/codecov/c/github/jaumevn/XColor)

# XColor

XColor is a color handling extension for UIColor written in Swift.

## Examples

```swift
// Create solid colors with hex string or hex number

let colorString = UIColor(hex: "#5F7EFB")
let colorNumber = UIColor(hex: 0xFF3033)
```

```swift
// Create colors with alpha channel with implicit 8 character representation or using explicit alpha init

let colorAlpha = UIColor(hex: "#5F7EFB50")
let colorAlphaExplicit = UIColor(hex: "#5F7EFB", alpha: 0.5)

```

```swift
// Support for shorthand 3 character representation, 6 character representation and 8 character representation

let color3Char = UIColor(hex: "#57F")
let color6Char = UIColor(hex: "#5F7EFB")
let color8Char = UIColor(hex: "#5F7EFB50")

```

## Requirements

- iOS 8.0+
- Xcode 10.2+
- Swift 5+

## Installation

### Cocapods

CocoaPods is a dependency manager for Cocoa projects. For usage and installation instructions, visit their website. To integrate XColor into your Xcode project using CocoaPods, specify it in your Podfile:

```
pod 'XColor'
```

### Carthage

Carthage is a decentralized dependency manager that builds your dependencies and provides you with binary frameworks. To integrate XColor into your Xcode project using Carthage, specify it in your Cartfile:

### Swift Package Manager

## Credits

XColor is owned and maintained by Jaume Viñas Navas

## License

XColor is released under the MIT license. See LICENSE for details.
