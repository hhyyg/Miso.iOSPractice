//
//  QuotationViewController.swift
//  ReadingAutoLayout
//
//  Created by Hiroka Yago on 2017/12/13.
//  Copyright © 2017 Hiroka Yago. All rights reserved.
//

import UIKit

class QuotationViewController: UIViewController {

    @IBOutlet weak var textLabel: UILabel!
    
    @IBAction func tapButton(_ sender: UIButton) {
        self.textLabel.text = (self.textLabel.text ?? "") + (self.textLabel.text ?? "")
    
    }
}
