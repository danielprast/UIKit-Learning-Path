//
//  AppConfig.swift
//  UIKit Learning Path
//
//  Created by Okelaptop on 04/01/22.
//

import UIKit

class AppConfig {
    static let shared = AppConfig()
    private init() {}
    
    var rootController: UIViewController {
        get {
            return GestureLessonStoryBoardedController()
        }
    }
}
