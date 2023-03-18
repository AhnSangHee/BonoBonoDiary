//
//  Common.swift
//  BonoBonoDiary
//
//  Created by Selina on 2023/03/19.
//

import SwiftUI

struct Common {
    static let hueColors = stride(from: 0, to: 1, by: 0.01).map {
        Color(hue: $0, saturation: 1, brightness: 1)
    }
    
    static let bonobonoGradient = LinearGradient(
        gradient: Gradient(colors: Common.hueColors),
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
}
