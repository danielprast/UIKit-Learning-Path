//
//  OtherViewController.swift
//  UIKit Learning Path
//
//  Created by Okelaptop on 04/01/22.
//

import UIKit

protocol OtherViewControllerDelegate : class {
    func getStringFromOtherViewController(string: String!)
}

class OtherViewController: UIViewController {
    
    //@IBOutlet weak var mainView: UIView!
    
    @IBAction func dismiss(_ sender: Any?) {
        delegate?.getStringFromOtherViewController(string: "Hello from OtherViewController")
    }
    
    var string: String?
    var delegate: OtherViewControllerDelegate?
    
    override func loadView() {
        self.view = loadViewFromNib(nibName: "\(OtherViewController.self)")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        cetak(withKey: "string", string!)
        
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
