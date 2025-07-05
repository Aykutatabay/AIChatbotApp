//
//  Color+Extension.swift
//  AIChatbotApp
//
//  Created by Aykut Atabay on 5.07.2025.
//

import SwiftUI

extension Color {
    init?(hex: String) {
        var hexString = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        // '#' varsa baştan sil
        if hexString.hasPrefix("#") {
            hexString.removeFirst()
        }
        
        // 6 haneli olmalı (RRGGBB)
        guard hexString.count == 6 else {
            return nil
        }
        
        var rgbValue: UInt64 = 0
        Scanner(string: hexString).scanHexInt64(&rgbValue)
        
        let red = Double((rgbValue & 0xFF0000) >> 16) / 255.0
        let green = Double((rgbValue & 0x00FF00) >> 8) / 255.0
        let blue = Double(rgbValue & 0x0000FF) / 255.0
        
        self.init(red: red, green: green, blue: blue)
    }
}
