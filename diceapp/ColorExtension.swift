import SwiftUI

extension Color {
    init?(hex: String) {
        let hex = hex.hasPrefix("#") ? String(hex.dropFirst()) : hex
 
        guard hex.count == 6 || hex.count == 8 else {
            return nil
        }

        var rgb: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&rgb)

        let red = Double((rgb >> 16) & 0xFF) / 255.0
        let green = Double((rgb >> 8) & 0xFF) / 255.0
        let blue = Double(rgb & 0xFF) / 255.0
        let alpha = hex.count == 8 ? Double((rgb >> 24) & 0xFF) / 255.0 : 1.0

        self.init(red: red, green: green, blue: blue, opacity: alpha)
    }
}
