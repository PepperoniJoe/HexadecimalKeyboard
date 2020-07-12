//
//  ViewController.swift
//  KeyboardCustomAppOnly
//
//  Created by Marcy Vernon on 7/11/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var textFieldKB1: UITextField!
    @IBOutlet var textFieldKB2: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createKeyboard(textFieldKB1)
     //   createKeyboard(textFieldKB2)
        textFieldKB1.backgroundColor = .systemGroupedBackground
        textFieldKB2.backgroundColor = .systemGroupedBackground
    }
    
    func createKeyboard(_ textField: UITextField) {
        textField.clearButtonMode    = .whileEditing
        let hexadecimalKeyboard      = HexadecimalKeyboard(target: textField)
        textField.inputView          = hexadecimalKeyboard
        hexadecimalKeyboard.delegate = self
    }
    
    @IBAction func clickTextField(_ sender: UITextField) {
        sender.reloadInputViews()
        createKeyboard(sender)
    }
} // end of View Controller


extension ViewController: RemoveKeyboardDelegate {
    func removeKeyboard() {
        textFieldKB1.inputView?.removeFromSuperview()
        textFieldKB2.inputView?.removeFromSuperview()
    }
}
    
