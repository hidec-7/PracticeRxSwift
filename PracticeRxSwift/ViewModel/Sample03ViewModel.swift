//
//  Sample03ViewModel.swift
//  PracticeRxSwift
//
//  Created by hideto c. on 2021/05/27.
//

import RxSwift

class Sample03ViewModel {
    
    var helloWorldObservable: Observable<String> {
        return helloWorldSubject.asObservable()
    }
    
    private let helloWorldSubject = PublishSubject<String>()
    
    func updateItem() {
        helloWorldSubject.onNext("Hellow World!")
        helloWorldSubject.onNext("Hellow World!")
        helloWorldSubject.onNext("Hellow World!")
        helloWorldSubject.onCompleted()
    }
}
