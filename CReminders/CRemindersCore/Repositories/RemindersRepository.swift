//
//  RemindersRepository.swift
//  CRemindersCore
//
//  Created by Hiroka Yago on 2017/12/15.
//  Copyright © 2017 Hiroka Yago. All rights reserved.
//
public protocol RemindersRepository: class {
    func save(_ reminder: Reminder)
    func load() -> [Reminder]
}
