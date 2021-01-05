//
//  view.swift
//  UIKit Learning Path
//
//  Created by Daniel Prastiwa on 05/01/21.
//

import Foundation
import UIKit
import SwiftUI

class ViewTopicController : UIViewController {
    
    var view1 = UIView()
    var view2 = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        //learnView()
        viewExcersise()
    }
    
    private func learnView() {
        let viewFrame = CGRect(x: 0, y: 0, width: 100, height: 100)
        let view = UIView(frame: viewFrame)
        view.backgroundColor = .purple
        view.alpha = 0.5
        let t = CGAffineTransform(translationX: 200, y: 200)
        let r = CGAffineTransform(rotationAngle: .pi / 4)
        let s = CGAffineTransform(scaleX: 2, y: 3)
        view.transform = s.concatenating(r).concatenating(t)
        self.view.addSubview(view)
        
        let view2 = UIView(frame: CGRect(x: 200, y: 200, width: 100, height: 100))
        view2.backgroundColor = .green
        let view3 = UIView(frame: CGRect(x: 10, y: 10, width: 50, height: 50))
        view3.backgroundColor = .purple
        let view4 = UIView(frame: CGRect(x: 300, y: 300, width: 50, height: 50))
        view4.backgroundColor = .brown
        
        view2.addSubview(view3)
        self.view.addSubview(view2)
        self.view.addSubview(view4)
    }
    
    private func viewExcersise() {
        initialCode()
        
        //1
        //moveRedViewIntoTheTopRightOfTheBlueView()
        
        //2
        //moveRedViewIntoTheBottomRightCornerOfTheBlueView()
        
        //3
        //transformRedViewIntoTheDiamondAndMoveToBottomMiddleOfBlueView()
        
        //4
        //deleteTheRedView()
    }
    
    // soluse soal 4
    private func deleteTheRedView() {
        view2.removeFromSuperview()
    }
    
    // solusi soal 3
    private func transformRedViewIntoTheDiamondAndMoveToBottomMiddleOfBlueView() {
        //view2.transform = CGAffineTransform(rotationAngle: .pi / 4)
        view2.transform = CGAffineTransform(rotationAngle: 45 * .pi / 180)
        view2.center = CGPoint(
            x: view1.bounds.midX,
            y: view1.bounds.maxY
        )
    }
    
    // solusi soal 2
    private func moveRedViewIntoTheBottomRightCornerOfTheBlueView() {
        view2.center = CGPoint(
            x: view1.bounds.maxX - (view2.bounds.size.width / 2),
            y: view1.bounds.maxY - (view2.bounds.size.width / 2)
        )
    }
    
    // solusi soal 1
    private func moveRedViewIntoTheTopRightOfTheBlueView() {
        view2.center = CGPoint(
            x: view1.bounds.maxX - (view2.bounds.size.width / 2),
            y: view2.frame.size.height / 2
        )
    }
    
    private func initialCode() {
        // INITIAL CODE
        view1 = UIView(frame: CGRect(x: 100, y: 100, width: 200, height: 200))
        view1.backgroundColor = .blue
        
        view2 = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        view2.backgroundColor = .red
        
        view1.addSubview(view2)
        self.view.addSubview(view1)
        // END OF INITIAL CODE
    }
    
    private func sinau() {
        let subViewFrame: CGRect = .init(x: 0, y: 0, width: 50, height: 50)
        let viewFrame = CGRect(x: 0, y: 0, width: 100, height: 100)
        let aView = UIView(frame: viewFrame)
        let bView = UIView(frame: subViewFrame)
        aView.backgroundColor = .blue
        bView.backgroundColor = .red
        //aView.layer.cornerRadius = 10
        //bView.layer.cornerRadius = 10
        //aView.clipsToBounds = true
        
        //aView.addSubview(bView)
        
        let t = CGAffineTransform(translationX: 200, y: 200)
        let r = CGAffineTransform(rotationAngle: .pi / 4)
        let s = CGAffineTransform(scaleX: 2, y: 3)
        
        cetak(withKey: "transformTranslation", t)
        cetak(withKey: "transformRotate", r)
        cetak(withKey: "scaleTransformation", s)
        
        aView.alpha = 0.5
        //aView.transform = r.concatenating(t)
        aView.transform = s.concatenating(r).concatenating(t)
        //aView.transform = t.concatenating(r).concatenating(s)
        //aView.transform = r.concatenating(s).concatenating(t)
        
        self.view.addSubview(aView)
        
        let button = UIButton(frame: viewFrame)
        button.setTitle("Tombol", for: .normal)
        button.setTitleColor(.black, for: .normal)
        self.view.addSubview(button)
        
        let view2 = UIView(frame: CGRect(x: 200, y: 200, width: 100, height: 100))
        view2.backgroundColor = .green
        let view3 = UIView(frame: CGRect(x: 10, y: 10, width: 50, height: 50))
        view3.backgroundColor = .purple
        let view4 = UIView(frame: CGRect(x: 300, y: 300, width: 50, height: 50))
        view4.backgroundColor = .brown
        
        view2.addSubview(view3)
        self.view.addSubview(view2)
        self.view.addSubview(view4)
        
        let view5 = UIView(frame: CGRect(x: 100, y: 400, width: 100, height: 100))
        view5.backgroundColor = .yellow
        
        let view6 = UIView(frame: view5.bounds.insetBy(dx: 10, dy: 10))
        view6.backgroundColor = .black
        view6.alpha = 0.3
        
        view5.addSubview(view6)
        self.view.addSubview(view5)
        
        print(view5.bounds.insetBy(dx: 10, dy: 10))
        print(view5.frame.insetBy(dx: 10, dy: 10))
        print(view5.bounds.minX)
        print(view5.frame.minX)
        print(view5.bounds.maxX)
        print(view5.frame.maxX)
        
        //view6.frame.size.height += 20
        //view6.frame.size.width += 20
        //view6.bounds.size.height -= 20
        //view6.bounds.size.width -= 20
        
        let view7 = UIView(frame: CGRect(x: 100, y: 600, width: 100, height: 100))
        view7.backgroundColor = .yellow

        let view8 = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        view8.backgroundColor = .red
        view8.alpha = 0.3

        view7.addSubview(view8)
        self.view.addSubview(view7)
        
        //view7.bounds.origin.y += 100
        view7.bounds.origin.x += 100
        
        cetak(withKey: "view3 center", view3.center)
        cetak(withKey: "view3 frame", view3.frame)
        view3.center =  CGPoint(x: view2.bounds.midX, y: view2.bounds.midY)
        cetak(withKey: "view3 center", view3.center)
        cetak(withKey: "view3 frame", view3.frame)
        
        cetak(withKey: "view2 bounds", view2.bounds)
        cetak(withKey: "view2 bounds midX", view2.bounds.midX)
    }
}

struct ViewTopicControllerPreview: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        
        func makeUIViewController(
            context: UIViewControllerRepresentableContext<ViewTopicControllerPreview.ContainerView>
        ) -> UIViewController {
            return ViewTopicController()
        }
        
        func updateUIViewController(
            _ uiViewController: ViewTopicControllerPreview.ContainerView.UIViewControllerType,
            context: UIViewControllerRepresentableContext<ViewTopicControllerPreview.ContainerView>
        ) {
        }
    }
}
