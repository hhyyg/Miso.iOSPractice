//
//  NumbersViewController.swift
//  RxPractice
//
//  Created by Hiroka Yago on 2017/12/22.
//  Copyright © 2017 Hiroka Yago. All rights reserved.
//


import RxSwift
import RxCocoa
import UIKit

class NumbersViewController: UIViewController {

    private var disposeBag = DisposeBag()
    
    @IBOutlet weak var number1: UITextField!
    @IBOutlet weak var number2: UITextField!
    @IBOutlet weak var number3: UITextField!
    @IBOutlet weak var result: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Observable.combineLatest(number1.rx.text.orEmpty, number2.rx.text.orEmpty, number3.rx.text.orEmpty) { textValue1, textValue2, textValue3 -> Int in
            return (Int(textValue1) ?? 0) + (Int(textValue2) ?? 0) + (Int(textValue3) ?? 0)
            }
            .map { $0.description }
            .bind(to: result.rx.text)
            .disposed(by: disposeBag)
    }

}
