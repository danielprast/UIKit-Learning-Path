//
//  CreateProtectedTexfield.swift
//  UIKit Learning Path
//
//  Created by Daniel Prastiwa on 11/05/21.
//

import UIKit

class CreateProtectedTexfield: NSObject, UITextFieldDelegate {
    
    init(textfieldWrapper: ProtectedTextfieldWrapper) {
        self.textfieldWrapper = textfieldWrapper
    }
    
    fileprivate let textfieldWrapper: ProtectedTextfieldWrapper
    
    public private(set) var textValue = ""
    
    fileprivate var protectedText: String {
        return textfieldWrapper.wrapCharacters(characters: textValue)
    }
    
    let textfield: UITextField = {
        let tf = UITextField()
        return tf
    }()
    
    func setupTextField() {        
        textfield.borderStyle = .roundedRect
        textfield.placeholder = "Enter Text Here"
        textfield.font = UIFont.systemFont(ofSize: 15)
        textfield.autocorrectionType = .no
        textfield.keyboardType = .asciiCapable
        textfield.returnKeyType = .default
        textfield.clearButtonMode = .whileEditing
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.text = textValue
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.text = protectedText
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
    
    func textField(
        _ textField: UITextField,
        shouldChangeCharactersIn range: NSRange,
        replacementString string: String
    ) -> Bool {
        let newString = (textField.text! as NSString).replacingCharacters(in: range, with: string)
        print("new string: \(newString)")
        textValue = newString
        return true
    }
}
