//
//  LearnImageViewVC.swift
//  New World
//
//  Created by Daniel Prastiwa on 16/03/21.
//  Copyright © 2021 Kipacraft. All rights reserved.
//

import Foundation
import UIKit

class LearnImageViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .green
        
        //let bundlePath = Bundle.main.path(forResource: "view", ofType: "jpg")!
        //let image = UIImage(contentsOfFile: bundlePath)!
        //let image = UIImage(named: "fruit")!
        //let imageTiled = image.resizableImage(withCapInsets: .zero, resizingMode: .tile)
        //let imageStretched = image.resizableImage(withCapInsets: .zero, resizingMode: .stretch)
        //imageView.image = imageStretched
        //imageView.contentMode = .scaleAspectFill
        //imageView.clipsToBounds = true
        
        //loadImageFromInternet()
        resizeImage(newSize: CGSize(width: 100, height: 100))
    }
    
    func loadImageFromInternet() {
        let imageView = UIImageView(frame: CGRect(x: 10, y: 100, width: 300, height: 300))
        
        let url = URL(string: "https://via.placeholder.com/1024.png")!
        do {
            let data = try Data(contentsOf: url)
            let image = UIImage(data: data)!
            imageView.image = image
        } catch {
            print(error)
        }
        
        self.view.addSubview(imageView)
    }
    
    func resizeImage(newSize size: CGSize) {
        let image = UIImage(named: "view")!
        let imageView = UIImageView(frame: CGRect(x: 50, y: 100, width: 300, height: 300))
        let renderer = UIGraphicsImageRenderer(size: size)
        let resizedImage = renderer.image { _ in
            image.draw(in: CGRect.init(origin: .zero, size: size))
        }
        imageView.image = resizedImage
        self.view.addSubview(imageView)
    }
}
