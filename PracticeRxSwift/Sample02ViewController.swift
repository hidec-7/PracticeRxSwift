//
//  Sample02ViewController.swift
//  PracticeRxSwift
//
//  Created by hideto c. on 2021/05/26.
//

import UIKit
import RxSwift
import RxCocoa

class Sample02ViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var nameCountLabel: UILabel!
    
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var addressCountLabel: UILabel!
    
    private let maxNameTextFieldSize = 10
    private let maxAddressTextFieldSize = 50
    
    let limitText: (Int) -> String = {
        return "あと\($0)文字"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nameTextField.addTarget(self, action: #selector(nameTextFieldEditingChanged(sender:)), for: .editingChanged)
        addressTextField.addTarget(self, action: #selector(addressTextFieldEditingChanged(sender:)), for: .editingChanged)
    }

    @objc func nameTextFieldEditingChanged(sender: UITextField) {
        guard let changedtext = sender.text else { return }
        let limitCount = maxNameTextFieldSize - changedtext.count
        nameCountLabel.text = limitText(limitCount)
    }
    
    @objc func addressTextFieldEditingChanged(sender: UITextField) {
        guard let changedText = sender.text else { return }
        let limitCount = maxAddressTextFieldSize - changedText.count
        addressCountLabel.text = limitText(limitCount)
    }
}
