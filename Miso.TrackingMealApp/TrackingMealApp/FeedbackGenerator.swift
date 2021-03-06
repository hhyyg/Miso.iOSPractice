//
//  File.swift
//  TrackingMealApp
//
//  Created by Hiroka Yago on 2017/12/06.
//  Copyright © 2017 Hiroka Yago. All rights reserved.
//

import Foundation
import UIKit

class FeedbackGenerator {
    enum Scene {
        case
        itemSaved,
        willSelectPhoto
    }

    private let impact = UIImpactFeedbackGenerator(style: .medium)
    private let notification = UINotificationFeedbackGenerator()

    func occurred(_ scene: FeedbackGenerator.Scene) {
        switch scene {
        case .itemSaved:
            notification.notificationOccurred(.success)
        case .willSelectPhoto:
            impact.impactOccurred()
        }
    }
}
