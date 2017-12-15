//
//  InMemoryRemindersRepository.swift
//  CReminders
//
//  Created by Hiroka Yago on 2017/12/15.
//  Copyright © 2017 Hiroka Yago. All rights reserved.
//
import CRemindersCore

class InMemoryRemindersRepository: RemindersRepository {

    private static var reminders = [ Reminder(title: "first item") ]

    func save(_ reminder: Reminder) {
        InMemoryRemindersRepository.reminders.append(reminder)
    }

    func load() -> [Reminder] {
        return InMemoryRemindersRepository.reminders
    }

}
