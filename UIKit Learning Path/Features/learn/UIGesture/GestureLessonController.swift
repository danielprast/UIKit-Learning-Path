//
//  GestureLessonController.swift
//  UIKit Learning Path
//
//  Created by Daniel Prastiwa on 20/12/21.
//

import UIKit

class GestureLessonController: UIViewController, UIGestureRecognizerDelegate {
    
    let v1 = UIView(frame: CGRect(x: 0, y: 100, width: 100, height: 100))
    let v2 = UIView(frame: CGRect(x: 200, y: 100, width: 100, height: 100))
    let v3 = UIView(frame: CGRect(x: 100, y: 200, width: 100, height: 100))
    let v4 = UIView(frame: CGRect(x: 0, y: 300, width: 100, height: 100))
    let v5 = UIView(frame: CGRect(x: 200, y: 300, width: 100, height: 100))
    let v6 = UIView(frame: CGRect(x: 100, y: 400, width: 100, height: 100))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        // MARK: - UITapGestureRecognizer
        v1.backgroundColor = .green
        view.addSubview(v1)
        
        let t1 = UITapGestureRecognizer(target: self, action: #selector(singleTap))
        t1.numberOfTapsRequired = 3
        v1.addGestureRecognizer(t1)
        
        // MARK: - UIPinchGestureRecognizer
        v2.backgroundColor = .yellow
        self.view.addSubview(v2)
        
        let t2 = UIPinchGestureRecognizer(target: self, action: #selector(pinch))
        v2.addGestureRecognizer(t2)
        
        // MARK: - UIRotationGestureRecognizer
        v3.backgroundColor = .red
        self.view.addSubview(v3)
        
        let t3 = UIRotationGestureRecognizer(target: self, action: #selector(rotate))
        v3.addGestureRecognizer(t3)
        
        // MARK: - UISwipeGestureRecognizer
        v4.backgroundColor = .purple
        view.addSubview(v4)
        
        let t4_right = UISwipeGestureRecognizer(target: self, action: #selector(swipe))
        v4.addGestureRecognizer(t4_right)
        let t4_left = UISwipeGestureRecognizer(target: self, action: #selector(swipe))
        t4_left.direction = .left
        v4.addGestureRecognizer(t4_left)
        
        // MARK: - UIPanGestureRecognizer
        v5.backgroundColor = .brown
        view.addSubview(v5)
        let t5 = UIPanGestureRecognizer(target: self, action: #selector(translate))
        v5.addGestureRecognizer(t5)
        
        // MARK: - UILongPressGestureRecognizer
        v6.backgroundColor = .blue
        v6.backgroundColor = .blue
        self.view.addSubview(v6)
        
        let t6 = UILongPressGestureRecognizer(target: self, action: #selector(longPress))
        t6.minimumPressDuration = 2
        v6.addGestureRecognizer(t6)
        
        // MARK: - UIScreenEdgePanGestureRecognizer
        let t7 = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(screen))
        t7.edges = .right
        t7.delegate = self
        view.addGestureRecognizer(t7)
        
        let t8 = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(screen))
        t8.edges = .left
        view.addGestureRecognizer(t8)
    }
    
    @objc func screen(_ s: UIScreenEdgePanGestureRecognizer) {
        guard s.view != nil else { return }
        
        if s.state == .began || s.state == .changed {
            let translation = s.translation(in: s.view)
            print("🔥 X: \(translation.x)")
            print("🔥 Y: \(translation.y)")
        }
    }
    
    @objc func longPress(_ l: UILongPressGestureRecognizer) {
        guard l.view != nil else { return }
        print("long press!!!")
    }
    
    @objc func translate(_ p: UIPanGestureRecognizer) {
        guard p.view != nil else { return }
        
        let translation = p.translation(in: p.view)
        
        if let view = p.view {
            view.center = CGPoint(
                x: view.center.x + translation.x,
                y: view.center.y + translation.y
            )
        }
        p.setTranslation(.zero, in: p.view)
    }
    
    @objc func swipe(_ s: UISwipeGestureRecognizer) {
        guard s.view != nil else { return }
        
        var move = 0
        if s.state == .ended {
            switch s.direction {
            case .right:
                move = 100
            case .left:
                move = -100
            default:
                break
            }
            
            if move != 0 {
                s.view?.transform = (s.view?.transform.translatedBy(x: CGFloat(move), y: 0))!
            }
        }
        
        print(s.direction)
    }
    
    @objc func rotate(_ r: UIRotationGestureRecognizer) {
        guard r.view != nil else { return }
        
        if r.state == .began || r.state == .changed {
            r.view?.transform = (r.view?.transform.rotated(by: r.rotation))!
            r.rotation = 0
        }
        
        print(r.velocity)
    }
    
    @objc func pinch(_ p: UIPinchGestureRecognizer) {
        guard p.view != nil else { return }
        
        if p.state == .began || p.state == .changed {
            p.view?.transform = (p.view?.transform.scaledBy(x: p.scale, y: p.scale))!
            p.scale = 1.0
        }
        
        print(p.velocity)
    }
    
    @objc func singleTap(_ tapGesture: UITapGestureRecognizer) {
        guard tapGesture.view != nil else { return }
        print("Tap!!!")
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
