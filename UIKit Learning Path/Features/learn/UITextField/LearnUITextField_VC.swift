//
//  LearnUITextField_VC.swift
//  UIKit Learning Path
//
//  Created by Daniel Prastiwa on 10/05/21.
//

import UIKit

class LearnUITextField_VC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("VC: \(String(describing: LearnUITextField_VC.self))")
        
        view.backgroundColor = .white
        
        //addTextField()
        addProtectedTextfield()
    }
    
    let protectedTextfield = CreateProtectedTexfield(textfieldWrapper: ProtectedTextfieldWrapperImpl())
    
    fileprivate func addProtectedTextfield() {
        protectedTextfield.setupTextField()
        let tf = protectedTextfield.textfield
        tf.delegate = protectedTextfield
        tf.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        tf.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(tf)
        
        let anchor1 = tf.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100)
        let anchor2 = tf.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        let anchor3 = tf.widthAnchor.constraint(equalToConstant: 200)
        NSLayoutConstraint.activate([anchor1, anchor2, anchor3])
    }
    
    fileprivate func addTextField() {
    
        let tf: UITextField = UITextField(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        tf.tag = 1
        tf.borderStyle = .roundedRect
        tf.font = UIFont.systemFont(ofSize: 15)
        tf.autocorrectionType = .no
        tf.keyboardType = .asciiCapable
        tf.returnKeyType = .default
        tf.clearButtonMode = .whileEditing
        tf.addTarget(self, action: #selector(editingChanged(_:)), for: .editingChanged)
        
        let iv = UIImageView()
        //let img = UIImage(named: "pencil")
        let img = UIImage(named: "pencil")
        iv.image = img
        iv.contentMode = .left
        
        tf.leftView = iv
        tf.leftViewMode = .unlessEditing
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.delegate = self
        self.view.addSubview(tf)
        let anchor1 = tf.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100)
        let anchor2 = tf.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        let anchor3 = tf.widthAnchor.constraint(equalToConstant: 200)
        NSLayoutConstraint.activate([anchor1, anchor2, anchor3])
    }
    
    @objc func editingChanged(_ sender: UITextField) {
        sender.text = sender.text?.replacingOccurrences(of: " ", with: "_")
        print("Editing Changed: \(sender.text)")
    }
    
}

extension LearnUITextField_VC: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("begin")
        print(textField.tag)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("-->end")
        print(textField.text)
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if string.isEmpty {
            return true
        }
        
        let decimalCharacters = CharacterSet.decimalDigits
        
        let decimalRange = string.rangeOfCharacter(from: decimalCharacters)
        
        if decimalRange != nil {
            return false
        }
        
        print("⛳️ String value: \(string)")
        //let lc = string
        //textField.insertText(lc)
        
        return true
    }
}
