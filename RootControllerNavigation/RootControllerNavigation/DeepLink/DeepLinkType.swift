//
//  DeeplinkType.swift
//  RootControllerNavigation
//
//  Created by Hiroka Yago on 2017/12/19.
//  Copyright © 2017 Hiroka Yago. All rights reserved.
//

enum DeepLinkType {
    
    enum Messages {
        case root
        case details(id: String)
    }
    
    case messages(Messages)
    case activity
    case newListing
    case request(id: String)
    
}
