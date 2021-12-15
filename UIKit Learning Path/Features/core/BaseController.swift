//
//  BaseController.swift
//  UIKit Learning Path
//
//  Created by Daniel Prastiwa on 13/12/21.
//

import UIKit

class BaseController: UIViewController {
    
    func inspectControllerName <Controller: UIViewController> (type: Controller.Type) {
        print("🔥 Page Class: \(String(describing: type))")
    }
}
