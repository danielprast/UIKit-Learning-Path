//
//  Extensions.swift
//  UIKit Learning Path
//
//  Created by Daniel Prastiwa on 15/12/21.
//

import UIKit

extension UIColor {
    
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
    
    static func mainBlue() -> UIColor {
        return UIColor.rgb(red: 17, green: 154, blue: 237)
    }
    
    static func buttonInactiveGray() -> UIColor {
        return UIColor(white: 0, alpha: 0.2)
    }
}
