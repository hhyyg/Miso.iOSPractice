//
//  RemindersView.swift
//  CRemindersCore
//
//  Created by Hiroka Yago on 2017/12/15.
//  Copyright © 2017 Hiroka Yago. All rights reserved.
//
public protocol RemindersView: class {
    func showNoReminders()
    func showReminders(reminders: [Reminder])
}
