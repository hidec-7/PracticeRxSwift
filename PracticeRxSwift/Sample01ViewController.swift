//
//  ViewController.swift
//  PracticeRxSwift
//
//  Created by hideto c. on 2021/05/26.
//

import UIKit
import RxSwift
import RxCocoa

class Sample01ViewController: UIViewController {
    
    private let disposeBag = DisposeBag()
    private let viewModel = Sample03ViewModel()

    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var passwordButton: UIButton!
    @IBOutlet weak var exitButton: UIButton!
    @IBOutlet weak var helpButton: UIButton!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var nextVCButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sampleHelloWorld()
//        setupItems()
    }
    
    private func sampleHelloWorld() {
        viewModel.helloWorldObservable
            .subscribe(onNext: { [weak self] value in
                print("value = \(value)")
            }, onCompleted: {
                print("onCompleted")
            }, onDisposed: {
                print("onDisposed")
            })
            .disposed(by: disposeBag)
        
        viewModel.updateItem()
    }
    
//    private func setupItems() {
//        loginButton.rx.tap
//            .subscribe(onNext: { [weak self] in
//                self?.messageLabel.text = "Tap Login Button"
//            })
//            .disposed(by: disposeBag)
//
//        passwordButton.rx.tap
//            .subscribe(onNext: { [weak self] in
//                self?.messageLabel.text = "Tap Password Button"
//            })
//            .disposed(by: disposeBag)
//
//        exitButton.rx.tap
//            .subscribe(onNext: { [weak self] in
//                self?.messageLabel.text = "Tap Exit Button"
//            })
//            .disposed(by: disposeBag)
//
//        helpButton.rx.tap
//            .subscribe(onNext: { [weak self] in
//                self?.messageLabel.text = "Tap Help Button"
//            })
//            .disposed(by: disposeBag)
//
//        nextVCButton.rx.tap
//            .subscribe(onNext: { [weak self] in
//                self?.performSegue(withIdentifier: "sample02", sender: nil)
//            })
//            .disposed(by: disposeBag)
//    }
}
