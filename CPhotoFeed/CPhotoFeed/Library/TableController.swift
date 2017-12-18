//
//  TableController.swift
//  CPhotoFeed
//
//  Created by Hiroka Yago on 2017/12/16.
//  Copyright © 2017 Hiroka Yago. All rights reserved.
//

import Foundation
import UIKit

class TableController<Model: Codable, Cell: UITableViewCell>: UITableViewController {

    var items = [Model]()

    override func viewDidLoad() {
        super.viewDidLoad()

        loadData()

        refreshControl = UIRefreshControl()
        refreshControl?.addTarget(self, action: #selector(handleRefresh), for: .valueChanged)
    }

    @objc private func handleRefresh() {
        loadData()
        refreshControl!.endRefreshing()
    }

    func loadData() {
    }

    func configure(cell: Cell, model: Model) {
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? Cell else {
            fatalError()
        }
        let item = items[indexPath.row]
        configure(cell: cell, model: item)

        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
