//
//  LearnUITextView_VC.swift
//  UIKit Learning Path
//
//  Created by Daniel Prastiwa on 11/05/21.
//

import UIKit

class LearnUITextView_VC: UIViewController {
    
    fileprivate func addTextView() {
        let tv = UITextView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        tv.tag = 1
        let s = """
        Ini Nomor telponnya: +628888888888.
        Besok cuaca bakal cerah. Indah sekali.
        Benar - benar indah.
        Ayo, pergi ke Liputan6 untuk baca berita
        """
        
        let content = NSMutableAttributedString(string: s,
                                                attributes: [
                                                    .font : UIFont.systemFont(ofSize: 20, weight: .medium),
                                                    .foregroundColor: UIColor(red: 0.251, green: 0.000, blue: 0.502, alpha: 1)
                                                ])
        
        let r = (content.string as NSString).range(of: "Liputan6")
        content.addAttribute(.link, value: "https://liputan6.com", range: r)
        
        let r2 = (content.string as NSString).range(of: "+628888888888")
        content.addAttribute(.link, value: "tel:+628888888888", range: r2)
        
        tv.attributedText = content
        tv.layer.borderWidth = 1
        tv.layer.borderColor = UIColor.lightGray.cgColor
        tv.isEditable = true
        tv.isSelectable = true
        tv.delegate = self
        
        tv.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(tv)
        let anchor4 = tv.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 100)
        let anchor5 = tv.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        let anchor6 = tv.widthAnchor.constraint(equalToConstant: 250)
        let anchor7 = tv.heightAnchor.constraint(equalToConstant: 300)
        NSLayoutConstraint.activate([anchor4, anchor5, anchor6, anchor7])
    }
    
    fileprivate func addTapEventOnView() {
        let tapEvent = UITapGestureRecognizer(target: self, action: #selector(onTapView))
        view.addGestureRecognizer(tapEvent)
    }
    
    @objc fileprivate func onTapView() {
        view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        
        //addTapEventOnView()
        addTextView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("VC: \(String(describing: LearnUITextView_VC.self))")
    }
    
}

// MARK: - UITextViewDelegate
extension LearnUITextView_VC: UITextViewDelegate {
    
    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
        print(URL)
        print(interaction)
        return true
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        let text = textView.text ?? "mbohh"
        print("did end editing \(text)")
    }
    
    func textViewDidChange(_ textView: UITextView) {
        let text = textView.text ?? "mbohh"
        print("did change \(text)")
    }
}
