//
//  SimpleValidationController.swift
//  RxPractice
//
//  Created by Hiroka Yago on 2017/12/22.
//  Copyright © 2017 Hiroka Yago. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class SimpleValidationController: UIViewController {

    private let disposeBag = DisposeBag()
    
    private let minimalUserNameLength = 5
    private let minimalPasswordLength = 5
    
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var text1: UITextField!
    @IBOutlet weak var text2: UITextField!
    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label1.text = "Username invalid"
        label2.text = "Password invalid"
        
        let userNameValid = text1.rx.text.orEmpty
            .map { $0.count >= 5 }
            .share(replay: 1)
        
        let passwordValid = text2.rx.text.orEmpty
            .map { $0.count >= 5 }
            .share(replay: 1)
        
        let everythingValid = Observable.combineLatest(userNameValid, passwordValid) {
            $0 && $1
        }
        .share(replay: 1)
        
//        userNameValid
//            .bind(to: text2.rx.isEnabled)
//            .disposed(by: disposeBag)
        
        userNameValid
            .bind(to: label1.rx.isHidden)
            .disposed(by: disposeBag)
        
//        passwordValid
//            .bind(to: text1.rx.isEnabled)
//            .disposed(by: disposeBag)
        
        passwordValid
            .bind(to: label2.rx.isHidden)
            .disposed(by: disposeBag)
        
        everythingValid
            .bind(to: button.rx.isEnabled)
            .disposed(by: disposeBag)
        
        button.rx.tap
            .subscribe(onNext: { [weak self] _ in self?.showAlert() })
            .disposed(by: disposeBag)
        
    }
    
    func showAlert() {
        let alert = UIAlertController(title: "RxExample", message: "This is wonderful", preferredStyle: .alert)
        
        let ok = UIAlertAction(title: "OK", style: .default) { action in
        }
        
        alert.addAction(ok)
        present(alert, animated: true, completion: nil)
    }
}
