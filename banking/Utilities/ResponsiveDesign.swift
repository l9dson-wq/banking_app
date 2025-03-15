//
//  ResponsiveDesign.swift
//  banking
//
//  Created by Andelson on 9/3/25.
//

import SwiftUI

struct DeviceResponsiveDesign {
    // MARK: - Device Detection
    
    /// Enum representing different device types
    enum DeviceType {
        case smallPhone    // iPhone SE, mini models
        case standardPhone // iPhone standard models
        case largePhone    // iPhone Plus, Pro Max models
        case iPad          // Standard iPads
        case iPadPro       // iPad Pro models
        case mac           // Mac with SwiftUI
        case unknown
    }
    
    /// The current device type
    static var deviceType: DeviceType {
        let screenWidth = UIScreen.main.bounds.width
        let screenHeight = UIScreen.main.bounds.height
        let diagonal = sqrt(pow(screenWidth, 2) + pow(screenHeight, 2))
        
        switch diagonal {
        case 0...700:
            return .smallPhone
        case 700...800:
            return .standardPhone
        case 800...1100:
            return .largePhone
        case 1100...1300:
            return .iPad
        case 1300...1700:
            return .iPadPro
        case _ where UIDevice.current.userInterfaceIdiom == .mac:
            return .mac
        default:
            return .unknown
        }
    }
    
    static func vStackSpacing(for geometry: GeometryProxy) -> CGFloat {
        switch deviceType {
        case .smallPhone:
            return geometry.size.height * -0.20
        case .standardPhone:
            return geometry.size.height * -0.20
        case .largePhone:
            return geometry.size.height * -0.01
        case .iPad, .iPadPro, .mac:
            return geometry.size.height * -0.05
        case .unknown:
            return geometry.size.height * -0.05
        }
    }
    
    static func WhatDeviceAmI(for geometry: GeometryProxy) -> DeviceType {
        switch deviceType {
        case .smallPhone:
            return .smallPhone
        case .standardPhone:
            return .standardPhone
        case .largePhone:
            return .largePhone
        case .iPad, .iPadPro, .mac:
            return .iPad
        case .unknown:
            return .mac
        }
    }
}
