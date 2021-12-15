//
//  LearnUIActivityMonitorView.swift
//  UIKit Learning Path
//
//  Created by Daniel Prastiwa on 13/12/21.
//

import UIKit

class LearnUIActivityMonitorView_Controller: BaseController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        createActivityIndicator()
        createUIProgressView()
        createUIPickerView()
        createPicker2()
    }
    
    let imagePickerDelegate = ImagePickerDelegate()
    
    let picker2 = UIPickerView(frame: .zero)
    
    fileprivate func createPicker2() {
        picker2.delegate = imagePickerDelegate
        picker2.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(picker2)
        NSLayoutConstraint.activate([
            picker2.topAnchor.constraint(equalTo: picker1.bottomAnchor, constant: 20),
            picker2.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            picker2.widthAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    let picker1 = UIPickerView(frame: .zero)
    
    fileprivate func createUIPickerView() {
        picker1.delegate = self
        picker1.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(picker1)
        
        NSLayoutConstraint.activate([
            picker1.topAnchor.constraint(equalTo: pv.bottomAnchor, constant: 20),
            picker1.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            picker1.widthAnchor.constraint(equalToConstant: 400)
        ])
        
        print("pickerview size: \(picker1.frame.size)")
    }
    
    let cryptoCurrencyStrings = ["bitcoin", "etherum", "monero", "filecoin"]
    let deepLearningStrings = ["tensorflow", "keras", "pytorch"]
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return cryptoCurrencyStrings.count
        } else {
            return deepLearningStrings.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            return cryptoCurrencyStrings[row]
        } else {
            return deepLearningStrings[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print("🔥 Component: ", component          )
        print("Row: ", row)
    }
    
    let pv = UIProgressView(frame: .zero)
    
    fileprivate func createUIProgressView() {
        pv.progressViewStyle = .default
        
        let progress = Progress()
        progress.totalUnitCount = 100
        progress.completedUnitCount = 35
        pv.observedProgress = progress
        //pv.setProgress(0.35, animated: true)
        
        pv.trackTintColor = .yellow
        pv.progressTintColor = .red
        pv.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(pv)
        
        let anchor_pv_1 = pv.topAnchor.constraint(equalTo: aiv.bottomAnchor, constant: 20)
        let anchor_pv_2 = pv.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        let anchor_pv_3 = pv.widthAnchor.constraint(equalToConstant: 400)
        let anchor_pv_4 = pv.heightAnchor.constraint(equalToConstant: 20)
        
        NSLayoutConstraint.activate([anchor_pv_1, anchor_pv_2, anchor_pv_3, anchor_pv_4])
    }
    
    let aiv = UIActivityIndicatorView(frame: .zero)
    
    fileprivate func createActivityIndicator() {
        if #available(iOS 13, *) {
            aiv.style = .medium
        } else {
            aiv.style = .gray
        }
        
        aiv.startAnimating()
        aiv.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(aiv)
        
        let anchor_aiv_1 = aiv.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20)
        let anchor_aiv_2 = aiv.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        
        NSLayoutConstraint.activate([anchor_aiv_1, anchor_aiv_2])
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        inspectControllerName(type: LearnUIActivityMonitorView_Controller.self)
    }
}

class ImagePickerDelegate: NSObject, UIPickerViewDelegate, UIPickerViewDataSource {
    
    let imagePickerStrings = ["coffee", "laptop", "phone"]
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return imagePickerStrings.count
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 100
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let image = UIImage(named: imagePickerStrings[row])
        let imageView = UIImageView()
        imageView.image = image
        imageView.contentMode = .scaleAspectFit
        //imageView.sizeToFit()
        return imageView
    }
    
}
