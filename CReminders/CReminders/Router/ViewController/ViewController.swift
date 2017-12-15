//
//  ViewController.swift
//  CReminders
//
//  Created by Hiroka Yago on 2017/12/15.
//  Copyright © 2017 Hiroka Yago. All rights reserved.
//
protocol ViewController: class {
    var presentedView: ViewController? { get }
    func present(_ viewControllerToPresent: ViewController)
    func dismiss()
}
