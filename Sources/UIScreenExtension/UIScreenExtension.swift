//
//  UIScreenExtension.swift
//  UIScreenExtension
//
//  Created by Jens Schwarzer on 02/10/2017.
//  Copyright © 2017 marchv. All rights reserved.
//

import UIKit

internal extension UIDevice {
    
    // model identifiers can be found at https://www.theiphonewiki.com/wiki/Models
    static let modelIdentifier: String = {
        if let simulatorModelIdentifier = ProcessInfo().environment["SIMULATOR_MODEL_IDENTIFIER"] { return simulatorModelIdentifier }
        var sysinfo = utsname()
        uname(&sysinfo) // ignore return value
        return String(bytes: Data(bytes: &sysinfo.machine, count: Int(_SYS_NAMELEN)), encoding: .ascii)!.trimmingCharacters(in: .controlCharacters)
    }()
    
}

private func computeIfSome<T: Any, S: Any>(optional: T?, computation: ((T) -> S)) -> S? { if let some = optional { return computation(some) } else { return .none } }

@available(iOS 9.0, *)
public extension UIScreen {
    
    /// The screen dimension in inches
    static let diagonalInInches: CGFloat? = {
        switch UIDevice.modelIdentifier {
        case "iPhone4,1":                                            // iPhone 4S
            return 3.5
            
        case "iPhone5,1", "iPhone5,2":                   fallthrough // iPhone 5
        case "iPhone5,3", "iPhone5,4":                   fallthrough // iPhone 5C
        case "iPhone6,1", "iPhone6,2":                   fallthrough // iPhone 5S
        case "iPhone8,4":                                fallthrough // iPhone SE
        case "iPod5,1":                                  fallthrough // iPod Touch 5th generation
        case "iPod7,1":                                  fallthrough // iPod Touch 6th generation
        case "iPod9,1":                                              // iPod Touch 7th generation
            return 4.0
            
        case "iPhone7,2":                                fallthrough // iPhone 6
        case "iPhone8,1":                                fallthrough // iPhone 6S
        case "iPhone9,1", "iPhone9,3":                   fallthrough // iPhone 7
        case "iPhone10,1", "iPhone10,4":                 fallthrough // iPhone 8
        case "iPhone12,8":                                           // iPhone SE 2nd generation
            return 4.7
            
        case "iPhone13,1":                               fallthrough // iPhone 12 Mini
        case "iPhone14,4":                                           // iPhone 13 Mini
            return 5.4
            
        case "iPhone7,1":                                fallthrough // iPhone 6 Plus
        case "iPhone8,2":                                fallthrough // iPhone 6S Plus
        case "iPhone9,2", "iPhone9,4":                   fallthrough // iPhone 7 Plus
        case "iPhone10,2", "iPhone10,5":                             // iPhone 8 Plus
            return 5.5
            
        case "iPhone10,3", "iPhone10,6":                 fallthrough // iPhone X
        case "iPhone11,2":                               fallthrough // iPhone XS
        case "iPhone12,3":                                           // iPhone 11 Pro
            return 5.8
            
        case "iPhone11,8":                               fallthrough // iPhone XR
        case "iPhone12,1":                               fallthrough // iPhone 11
        case "iPhone13,2":                               fallthrough // iPhone 12
        case "iPhone13,3":                               fallthrough // iPhone 12 Pro
        case "iPhone14,5":                               fallthrough // iPhone 13
        case "iPhone14,2":                                           // iPHone 13 Pro
            return 6.1
            
        case "iPhone11,4", "iPhone11,6":                 fallthrough // iPhone XS Max
        case "iPhone12,5":                                           // iPhone 11 Pro Max
            return 6.5
            
        case "iPhone13,4":                               fallthrough // iPhone 12 Pro Max
        case "iPhone14,3":                                           // iPhone 13 Pro Max
            return 6.7
            
        case "iPad2,5", "iPad2,6", "iPad2,7":            fallthrough // iPad Mini
        case "iPad4,4", "iPad4,5", "iPad4,6":            fallthrough // iPad Mini 2
        case "iPad4,7", "iPad4,8", "iPad4,9":            fallthrough // iPad Mini 3
        case "iPad5,1", "iPad5,2":                       fallthrough // iPad Mini 4
        case "iPad11,1", "iPad11,2":                                 // iPad Mini 5
            return 7.9
            
        case "iPad2,1", "iPad2,2", "iPad2,3", "iPad2,4": fallthrough // iPad 2
        case "iPad3,1", "iPad3,2", "iPad3,3":            fallthrough // iPad 3rd generation
        case "iPad3,4", "iPad3,5", "iPad3,6":            fallthrough // iPad 4th generation
        case "iPad4,1", "iPad4,2", "iPad4,3":            fallthrough // iPad Air
        case "iPad5,3", "iPad5,4":                       fallthrough // iPad Air 2
        case "iPad6,3", "iPad6,4":                       fallthrough // iPad Pro (9.7 inch)
        case "iPad6,11", "iPad6,12":                     fallthrough // iPad 5th generation
        case "iPad7,5", "iPad7,6":                                   // iPad 6th generation
            return 9.7
            
        case "iPad7,11", "iPad7,12":                     fallthrough // iPad 7th generation
        case "iPad11,6", "iPad11,7":                                 // iPad 8th generation
            return 10.2
            
        case "iPad7,3", "iPad7,4":                       fallthrough // iPad Pro (10.5 inch)
        case "iPad11,3", "iPad11,4":                                 // iPad Air (3rd generation)
            return 10.5
            
        case "iPad13,1", "iPad13,2":                                 // iPad Air (4th generation)
            return 10.9
            
        case "iPad8,1", "iPad8,2", "iPad8,3", "iPad8,4": fallthrough // iPad Pro (11 inch)
        case "iPad8,9", "iPad8,10":                      fallthrough // iPad Pro (11 inch, 2nd generation)
        case "iPad13,4", "iPad13,5", "iPad13,6", "iPad13,7":         // iPad Pro (11 inch, 3rd generation)
            return 11.0
            
        case "iPad6,7", "iPad6,8":                       fallthrough // iPad Pro (12.9 inch)
        case "iPad7,1", "iPad7,2":                       fallthrough // iPad Pro (12.9 inch, 2nd generation)
        case "iPad8,5", "iPad8,6", "iPad8,7", "iPad8,8": fallthrough // iPad Pro (12.9 inch, 3rd generation)
        case "iPad8,11", "iPad8,12":                     fallthrough // iPad Pro (12.9 inch, 4th generation)
        case "iPad13,8", "iPad13,9", "iPad13,10", "iPad13,11":       // iPad Pro (12.9 inch, 5th generation)
            return 12.9
            
        default:                                                     // unknown model identifier
            return .none
        }
    }()
    
    /// The number of pixels per inch for this device
    static let pixelsPerInch: CGFloat? = computeIfSome(optional: dimensionInInches, computation: { main.nativeBounds.height / $0.height })
    
    /// The number of pixels per centimeter for this device
    static let pixelsPerCentimeter: CGFloat? = computeIfSome(optional: pixelsPerInch, computation: { $0 / 2.54 })
    
    /// The number of points per inch for this device
    static let pointsPerInch: CGFloat? = computeIfSome(optional: pixelsPerInch, computation: { $0 / main.nativeScale })
    
    /// The number of points per centimeter for this device
    static let pointsPerCentimeter: CGFloat? = computeIfSome(optional: pixelsPerCentimeter, computation: { $0 / main.nativeScale })
    
    /// The screen dimension in inches
    static let dimensionInInches: CGSize? = computeIfSome(optional: diagonalInInches, computation: {
        let ratio = main.nativeBounds.width / main.nativeBounds.height
        let height = $0 / sqrt(pow(ratio, 2) + 1)
        let width = ratio * height
        return CGSize(width: width, height: height)
    })
    
    /// The screen dimension in centimeters
    static let dimensionInCentimeters: CGSize? = computeIfSome(optional: pixelsPerCentimeter, computation: { CGSize(width: main.nativeBounds.width / $0, height: main.nativeBounds.height / $0) })
    
}
