//
//  ViewController.swift
//  KeyboardCustomAppOnly
//
//  Created by Marcy Vernon on 7/11/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var hexField: [UITextField]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        _ = hexField.map { createKeyboard($0)}
    }
    
    
    func createKeyboard(_ textField: UITextField) {
        textField.backgroundColor = .systemGroupedBackground
        textField.clearButtonMode = .whileEditing
        
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
        _ = hexField.map { $0.inputView?.removeFromSuperview() }
    }
}
    
