//
//  RemindersPresenter.swift
//  CRemindersCore
//
//  Created by Hiroka Yago on 2017/12/15.
//  Copyright © 2017 Hiroka Yago. All rights reserved.
//
public class RemindersPresenter {

    weak var view: RemindersView? //TODO
    let router: Router
    let repository: RemindersRepository

    public init(view: RemindersView,
                router: Router,
                repository: RemindersRepository) {
        self.view = view
        self.router = router
        self.repository = repository
    }

    public func loadReminders() {
        let reminders = repository.load()
        reminders.isEmpty ? view?.showNoReminders() : view?.showReminders(reminders: reminders)
    }

    public func addNewReminder() {
        router.route(to: .addReminder)
    }
}
