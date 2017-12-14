//
//  Scroll1ViewController.swift
//  ReadingAutoLayout
//
//  Created by Hiroka Yago on 2017/12/14.
//  Copyright © 2017 Hiroka Yago. All rights reserved.
//

import UIKit

class Scroll1ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBAction func tapButton(_ sender: Any) {
        print(label.text ?? "")
        label.text = (label.text ?? "") + (label.text ?? "")
    }
    
}
