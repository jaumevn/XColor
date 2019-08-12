[![Build Status](https://travis-ci.com/jaumevn/XColor.svg?branch=master)](https://travis-ci.com/jaumevn/XColor)
[![codecov](https://codecov.io/gh/jaumevn/XColor/branch/dev/graph/badge.svg)](https://codecov.io/gh/jaumevn/XColor)

# XColor

XColor is a color handling extension for UIColor written in Swift.

## Examples

XColor supports alpha channel with implicit and explicit convenience initializers:

```swift
// Set alpha with 8 character representation
let colorAlphaString = UIColor("#5F7EFB50")

// Set alpha channel with explicit convenience init
let colorAlphaExplicit = UIColor("#5F7EFB", alpha: 0.5)
```

You can use multiple character representations:

```swift
// 3 character representation
let color3CharString = UIColor("#57F")

// 6 character representation
let color6CharString = UIColor("#5F7EFB")

// 8 character representation (alpha channel)
let color8CharString = UIColor("#5F7EFB50")
```

Define your colors with hex string or number:

```swift
// Create solid colors with hex string or hex number
let colorString = UIColor("#5F7EFB")
let colorNumber = UIColor(0xFF3033)
```

## Installation

### Cocapods

CocoaPods is a dependency manager for Cocoa projects. For usage and installation instructions, visit their website. To integrate XColor into your Xcode project using CocoaPods, specify it in your Podfile:

```swift
pod "XColor"
```

### Carthage

Carthage is a decentralized dependency manager that builds your dependencies and provides you with binary frameworks. To integrate XColor into your Xcode project using Carthage, specify it in your Cartfile:

```swift
github "jaumevn/XColor" "0.1"
```

## Requirements

- iOS 8.0+
- Xcode 10.2+
- Swift 5+

## Credits

XColor is owned and maintained by [Jaume Viñas Navas](https://github.com/jaumevn)

## License

XColor is released under the MIT license. See [LICENSE](https://github.com/jaumevn/XColor/blob/master/LICENSE) for details.
