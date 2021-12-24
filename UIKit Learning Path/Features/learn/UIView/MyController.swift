//
//  MyController.swift
//  UIKit Learning Path
//
//  Created by Daniel Prastiwa on 24/12/21.
//

import UIKit

//class MyController: UIViewController {
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//    }
//}

class StoryMyView1: UIView {
    var contentView: AwesomeView!
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    fileprivate func setupView() {
        contentView = AwesomeView.loadViewFromNib()
        contentView.backgroundColor = .yellow
        contentView.frame = self.bounds
        addSubview(contentView)
    }
}
