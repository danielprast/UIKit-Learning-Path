//
//  AwesomeView.swift
//  UIKit Learning Path
//
//  Created by Daniel Prastiwa on 24/12/21.
//

import UIKit

//@IBDesignable
class AwesomeView: UIView {
    
    @IBOutlet weak var subView1: UIView!
    @IBOutlet weak var subview2: UIView!
    @IBOutlet weak var subview3: UIView!
    
    static func loadViewFromNib() -> AwesomeView {
        let bundle = Bundle(for: self)
        let nib = UINib(nibName: "\(AwesomeView.self)", bundle: bundle)
        return nib.instantiate(withOwner: nil, options: nil).first {
            ($0 as? UIView)?.restorationIdentifier == "1"
        }! as! AwesomeView
    }
}
