//
//  PertamaViewController.swift
//  UIKit Learning Path
//
//  Created by Okelaptop on 04/01/22.
//

import UIKit

class PertamaViewController: BaseController, OtherViewControllerDelegate {
    
    lazy var nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Present", for: .normal)
        button.addTarget(self, action: #selector(handleNext), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    @objc fileprivate func handleNext() {
        let controller = SecondViewController()
//        let ovc = OtherViewController()
//        ovc.string = "Hello From PertamaController"
//        ovc.delegate = self
        controller.modalTransitionStyle = .crossDissolve
        self.present(controller, animated: true)
    }
    
    func getStringFromOtherViewController(string: String!) {
        cetak(withKey: "string on pertama", string ?? "Zonk")
        self.dismiss(animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        view.backgroundColor = .white
        
        view.addSubview(nextButton)
        NSLayoutConstraint.activate([
            nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nextButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        inspectControllerName(type: PertamaViewController.self)
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
