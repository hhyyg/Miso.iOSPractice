//
//  MealTableViewController.swift
//  TrackingMealApp
//
//  Created by Hiroka Yago on 2017/12/04.
//  Copyright © 2017 Hiroka Yago. All rights reserved.
//

import UIKit
import os.log

class MealTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.leftBarButtonItem = editButtonItem
        self.tableView.reloadData()

        if self.traitCollection.forceTouchCapability == UIForceTouchCapability.available {
            registerForPreviewing(with: self, sourceView: view)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return DataContainer.meals.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "MealTableViewCell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? MealTableViewCell else {
            fatalError()
        }

        let meal = DataContainer.meals[indexPath.row]
        cell.nameLabel.text = meal.name
        cell.photoImageView.image = meal.getPhotoImage()
        cell.ratingControl.rating = meal.rating

        return cell
    }

    @IBAction func unwindToMealList(sender: UIStoryboardSegue) {

        if let sourceViewController = sender.source as? MealViewController,
            let meal = sourceViewController.meal {

            if let selectedIndexPath = tableView.indexPathForSelectedRow {
                //Update
                DataContainer.meals[selectedIndexPath.row] = meal
                tableView.reloadRows(at: [selectedIndexPath], with: .none)
            } else {
                //new
                let newIndexPath = IndexPath(row: DataContainer.meals.count, section: 0)
                DataContainer.meals.append(meal)
                tableView.insertRows(at: [newIndexPath], with: .automatic)
            }

            saveMeals()
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)

        switch(segue.identifier ?? "") {
        case "AddItem":
            logger.debug("Adding a new meal.")
        case "ShowDetail":
            guard let mealDeatailViewController = segue.destination as? MealViewController else {
                fatalError()
            }

            guard let selectedMealCell = sender as? MealTableViewCell else {
                fatalError()
            }

            guard let indexPath = tableView.indexPath(for: selectedMealCell) else {
                fatalError()
            }

            let selectedMeal = DataContainer.meals[indexPath.row]
            mealDeatailViewController.set(delegate: self, meal: selectedMeal)
        default:
            fatalError("Unexpected Segue Identifier; \(String(describing: segue.identifier))")
        }
    }

    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            deleteMeal(at: indexPath)
        }
    }

    private func deleteMeal(at indexPath: IndexPath) {
        DataContainer.meals.remove(at: indexPath.row)
        saveMeals()
        tableView.deleteRows(at: [indexPath], with: .fade)
    }

    private func saveMeals() {
        DataContainer.save()
    }
}

extension MealTableViewController: UIViewControllerPreviewingDelegate {

    func previewingContext(_ previewingContext: UIViewControllerPreviewing, viewControllerForLocation location: CGPoint) -> UIViewController? {
        let position = tableView.convert(location, from: view)
        logger.debug(position)

        guard let indexPath = tableView.indexPathForRow(at: location) else {
            return nil
        }
        guard let cell = tableView.cellForRow(at: indexPath) as? MealTableViewCell else {
            return nil
        }
        let meal = DataContainer.meals[indexPath.row]

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "MealViewController") as! MealViewController
        vc.set(delegate: self, meal: meal)

        vc.preferredContentSize = CGSize(width: 0.0, height: UIScreen.main.bounds.size.height)

        previewingContext.sourceRect = view.convert(cell.frame, from: tableView)
        return vc
    }

    func previewingContext(_ previewingContext: UIViewControllerPreviewing, commit viewControllerToCommit: UIViewController) {
        show(viewControllerToCommit, sender: self)
    }

}

extension MealTableViewController: MealViewControllerDelegate {

    func mealViewController(_ viewController: MealViewController, mealDeleteDidTap meal: Meal) {
        guard let i = (DataContainer.meals.index { $0.id == meal.id }) else {
            logger.debug("no found meal:\(meal.id) \(meal.name)")
            return
        }
        let indexPath = IndexPath(row: i, section: 0)
        deleteMeal(at: indexPath)
    }
}
