//
//  SomePageController.swift
//  UIKit Learning Path
//
//  Created by Daniel Prastiwa on 08/12/21.
//

import UIKit

final class SomePageController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        let aboutView = AboutView()
        
        view.addSubview(aboutView)
        
        aboutView.translatesAutoresizingMaskIntoConstraints = false
        aboutView.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
        aboutView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        aboutView.widthAnchor.constraint(equalToConstant: 300).isActive = true
        aboutView.heightAnchor.constraint(equalToConstant: 500).isActive = true
        
        print(aboutView.bounds)
        print(aboutView.frame.size)
    }
}
