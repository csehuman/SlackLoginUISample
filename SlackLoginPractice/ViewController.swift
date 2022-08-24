//
//  ViewController.swift
//  SlackLoginPractice
//
//  Created by Paul Lee on 2022/08/24.
//

import UIKit

class ViewController: UIViewController {

    let charSet: CharacterSet = {
        var cs = CharacterSet.lowercaseLetters
        cs.insert(charactersIn: "0123456789")
        cs.insert(charactersIn: "-")
        return cs.inverted
    }()
    
    @IBOutlet weak var urlField: UITextField!
    
    @IBOutlet weak var placeholderLabel: UILabel!
    
    @IBOutlet weak var placeholderLeadingConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var nextButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}


extension ViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        print(">>>>", textField.text)
        
        if string.count > 0 {
            guard string.rangeOfCharacter(from: charSet) == nil else {
                return false
            }
        }
        
        let finalText = NSMutableString(string: textField.text ?? "")
        finalText.replaceCharacters(in: range, with: string)
        
        let font = textField.font ?? UIFont.systemFont(ofSize: 16)
        
        let dict = [NSAttributedString.Key.font: font]
        
        let width = finalText.size(withAttributes: dict).width
        
        placeholderLeadingConstraint.constant = width
        
        if finalText.length == 0 {
            placeholderLabel.text = "workspace-url.slack.com"
        } else {
            placeholderLabel.text = ".slack.com"
        }
        
        return true
    }
}
