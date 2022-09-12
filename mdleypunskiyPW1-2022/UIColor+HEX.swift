//
//  UIColorExtension.swift
//  mdleypunskiyPW1
//
//  Created by Maksim on 14.09.2021.
//
import UIKit

// Extension of UIColor class which allows us to transform hex color code to UIColor.
extension UIColor{
    convenience init?(hex: String){
        
        // Trimming # from the begining of color code.
        let strWithoutSharp = hex.replacingOccurrences(of: "#", with: "")
        
        var rgb: UInt64 = 0
        
        // Casting string-represented hex-code to int-represented hex-code.
        guard Scanner(string: strWithoutSharp).scanHexInt64(&rgb)
        else { return nil }
        
        // Separating hex-code to the parts of red, gree, blue and alpha.
        let red = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat(rgb & 0x0000FF) / 255.0
        
        // Transfering separated colors to standart UIColor initializator.
        self.init(
            red: red,
            green: green,
            blue: blue,
            alpha: 1)
    }
}

// Fuctiion generates random correct hex color in string format (with #).
func randomHexColorString() -> String {
    return "#" +
        // Color for red.
        String(Int.random(in: 0...255), radix: 16) +
        // Color for green.
        String(Int.random(in: 0...255), radix: 16) +
        // Color for blue.
        String(Int.random(in: 0...255), radix: 16)
}
