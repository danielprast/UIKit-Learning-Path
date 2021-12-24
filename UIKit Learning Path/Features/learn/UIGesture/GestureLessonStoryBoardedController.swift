//
//  GestureLessonStoryBoardedController.swift
//  UIKit Learning Path
//
//  Created by Daniel Prastiwa on 23/12/21.
//

import UIKit

class GestureLessonStoryBoardedController: UIViewController {
    
    @IBAction func pinch(_ p: UIPinchGestureRecognizer) {
        guard p.view != nil else { return }
        
        if p.state == .began || p.state == .changed {
            p.view?.transform = (p.view?.transform.scaledBy(x: p.scale, y: p.scale))!
            p.scale = 1.0
        }
        
        print(p.velocity)
    }
    
    @IBOutlet weak var bottomView: UIView!
    
    override func loadView() {
        self.view = loadViewFromNib(nibName: "\(GestureLessonStoryBoardedController.self)")
        setupBottomView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
//        guard let awesomeView = Bundle.main.loadNibNamed("AwesomeView", owner: self, options: nil)?.first as? AwesomeView else { return }
//        view.addSubview(awesomeView)
//        awesomeView.frame = .init(x: 150, y: 400, width: 225, height: 128)
    }
    
    fileprivate func setupBottomView() {
        let storyMyView1 = StoryMyView1(frame: .zero)
        bottomView.addSubview(storyMyView1)
        bottomView.clipsToBounds = true
        
        storyMyView1.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            storyMyView1.topAnchor.constraint(equalTo: bottomView.topAnchor),
            storyMyView1.bottomAnchor.constraint(equalTo: bottomView.bottomAnchor),
            storyMyView1.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor),
            storyMyView1.trailingAnchor.constraint(equalTo: bottomView.trailingAnchor)
        ])
    }
}

extension UIViewController {
    
    func loadViewFromNib(nibName: String) -> UIView? {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }

}
