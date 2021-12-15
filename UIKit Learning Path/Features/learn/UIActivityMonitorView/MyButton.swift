//
//  MyButton.swift
//  UIKit Learning Path
//
//  Created by Daniel Prastiwa on 15/12/21.
//

import UIKit

class MyButton: UIButton {
    
    override func titleRect(forContentRect contentRect: CGRect) -> CGRect {
        let result = super.titleRect(forContentRect: contentRect)
        return result.insetBy(dx: -20, dy: -10)
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
