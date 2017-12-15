//
//  UIViewController.swift
//  CReminders
//
//  Created by Hiroka Yago on 2017/12/15.
//  Copyright © 2017 Hiroka Yago. All rights reserved.
//

import UIKit
import CRemindersCore

class AddReminderViewController: UIViewController {

    private var presenter: AddReminderPresenter!
    private var titleTextField: UITextField!

    func setPresenter(_ presenter: AddReminderPresenter) {
        self.presenter = presenter
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
    }

    private func initView() {
        view.backgroundColor = .white
        title = "Add Reminder"
        navigationController?.navigationBar.prefersLargeTitles = true
        setRightBarButton()
        setLeftBarButton()
        addTitleTextField()
    }

    private func setRightBarButton() {
        let saveButton = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveReminder))
        navigationItem.setRightBarButton(saveButton, animated: false)
    }

    private func setLeftBarButton() {
        let cancelButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancel))
        navigationItem.setLeftBarButton(cancelButton, animated: false)
    }

    private func addTitleTextField() {
        titleTextField = UITextField()
        titleTextField.placeholder = "Title"
        view.addSubview(titleTextField)
        setTitleTextFieldConstraints()
    }

    private func setTitleTextFieldConstraints() {
        let margins = view.layoutMarginsGuide
        titleTextField.translatesAutoresizingMaskIntoConstraints = false
        titleTextField.leadingAnchor.constraint(equalTo: margins.leadingAnchor).isActive = true
        titleTextField.trailingAnchor.constraint(equalTo: margins.trailingAnchor).isActive = true
        let topAnchor = view.safeAreaLayoutGuide.topAnchor
        titleTextField.topAnchor.constraint(equalTo: topAnchor, constant: 20).isActive = true
    }

    @objc func saveReminder() {
        presenter.save()
    }

    @objc func cancel() {
        presenter.cancel()
    }

}

extension AddReminderViewController: AddReminderView {
    var reminderTitle: String {
        return titleTextField.text ?? ""
    }
}
