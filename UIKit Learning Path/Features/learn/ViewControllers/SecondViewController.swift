//
//  SecondViewController.swift
//  UIKit Learning Path
//
//  Created by Okelaptop on 04/01/22.
//

import UIKit

class SecondViewController: UIViewController {
    
    static let TAG = "\(SecondViewController.self)"
    
    deinit {
        cetak(withKey: SecondViewController.TAG, "reclaimed memory from this controller")
    }
    
    override func loadView() {
        view = loadViewFromNib(nibName: "\(SecondViewController.self)")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func dismissThis(_ sender: Any) {
        dismiss(animated: true)
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
