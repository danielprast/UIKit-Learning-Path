//
//  AboutView.swift
//  UIKit Learning Path
//
//  Created by Daniel Prastiwa on 08/12/21.
//

import UIKit

final class AboutView: UIView {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configureView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.configureView()
    }
    
    private func configureView() {
        guard let view = self.loadViewFromNib(nibName: "AboutView") else { return }        
        view.frame = self.bounds
        self.addSubview(view)
    }
    
    func configureView(title: String) {
        self.titleLabel.text = title
    }
}
