//
//  Sample02ViewController.swift
//  PracticeRxSwift
//
//  Created by hideto c. on 2021/05/26.
//

import UIKit
import RxSwift
import RxCocoa
import RxOptional

class Sample02ViewController: UIViewController {
    
    private let disposeBag = DisposeBag()

    @IBOutlet private weak var nameTextField: UITextField!
    @IBOutlet private weak var nameCountLabel: UILabel!
    
    @IBOutlet private weak var addressTextField: UITextField!
    @IBOutlet private weak var addressCountLabel: UILabel!
    
    private let maxNameTextFieldSize = 10
    private let maxAddressTextFieldSize = 50
    
    let limitText: (Int) -> String = {
        return "あと\($0)文字"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        rxPattern()
    }
    
//    private func addTargetPattern() {
//        nameTextField.addTarget(self, action: #selector(nameTextFieldEditingChanged(sender:)), for: .editingChanged)
//        addressTextField.addTarget(self, action: #selector(addressTextFieldEditingChanged(sender:)), for: .editingChanged)
//    }
//
//    @objc func nameTextFieldEditingChanged(sender: UITextField) {
//        guard let changedtext = sender.text else { return }
//        let limitCount = maxNameTextFieldSize - changedtext.count
//        nameCountLabel.text = limitText(limitCount)
//    }
//
//    @objc func addressTextFieldEditingChanged(sender: UITextField) {
//        guard let changedText = sender.text else { return }
//        let limitCount = maxAddressTextFieldSize - changedText.count
//        addressCountLabel.text = limitText(limitCount)
//    }
    
    private func rxPattern() {
        nameTextField.rx.text
            .map{ [weak self] text -> String? in
                guard let text = text else { return nil }
                guard let maxNameTextFieldSize = self?.maxNameTextFieldSize else { return nil }
                let limitCount = maxNameTextFieldSize - text.count
                return self?.limitText(limitCount)
            }
            .filterNil()
            .bind(to: nameCountLabel.rx.text)
            .disposed(by: disposeBag)
        
        addressTextField.rx.text
            .map{ [weak self] text -> String? in
                guard let text = text else { return nil }
                guard let maxAddressTextFieldSize = self?.maxAddressTextFieldSize else { return nil }
                let limitCount = maxAddressTextFieldSize - text.count
                return self?.limitText(limitCount)
            }
            .filterNil()
            .bind(to: addressCountLabel.rx.text)
            .disposed(by: disposeBag)
    }
}
