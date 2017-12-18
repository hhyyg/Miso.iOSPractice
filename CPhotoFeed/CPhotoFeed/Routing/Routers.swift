//
//  Routers.swift
//  CPhotoFeed
//
//  Created by Hiroka Yago on 2017/12/18.
//  Copyright © 2017 Hiroka Yago. All rights reserved.
//

import Foundation
import Compass

struct LikesRoute: Routable {
    func navigate(to location: Location, from currentController: CurrentController) throws {

        guard let mediaId = location.arguments["mediaId"] else {
            fatalError()
        }

        guard let controller = UIStoryboard(name: "LikesController", bundle: nil).instantiateViewController(withIdentifier: "LikesController") as? LikesController else {
            fatalError()
        }

        controller.set(mediaId: mediaId)

        guard let navigationController = currentController.navigationController else {
            fatalError()
        }

        navigationController.pushViewController(controller, animated: true)
    }
}
