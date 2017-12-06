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

    var meals = [Meal]()

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.leftBarButtonItem = editButtonItem
        if let savedMeals = loadMeals() {
            meals += savedMeals
        } else {
            loadSampleMeals()
        }
        self.tableView.reloadData()

        if self.traitCollection.forceTouchCapability == UIForceTouchCapability.available {
            registerForPreviewing(with: self, sourceView: view)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return meals.count
    }

    private func loadSampleMeals() {
        let photo1 = UIImage(named: "meal1")
        let photo2 = UIImage(named: "meal2")
        let photo3 = UIImage(named: "meal3")

        guard let meal1 = Meal(name: "Caprese Salad", photo: photo1, rating: 4) else {
            fatalError("Unable to instantiate meal1")
        }
        guard let meal2 = Meal(name: "Chicken and Potatoes", photo: photo2, rating: 5) else {
            fatalError("Unable to instantiate meal2")
        }
        guard let meal3 = Meal(name: "Pasta with Meatballs", photo: photo3, rating: 3) else {
            fatalError("Unable to instantiate meal2")
        }

        meals += [meal1, meal2, meal3]
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "MealTableViewCell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? MealTableViewCell else {
            fatalError()
        }

        let meal = meals[indexPath.row]
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
                meals[selectedIndexPath.row] = meal
                tableView.reloadRows(at: [selectedIndexPath], with: .none)
            } else {
                //new
                let newIndexPath = IndexPath(row: meals.count, section: 0)
                meals.append(meal)
                tableView.insertRows(at: [newIndexPath], with: .automatic)
            }

            saveMeals()
        }
    }

    // MARK: - Navigation
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

            let selectedMeal = meals[indexPath.row]
            mealDeatailViewController.meal = selectedMeal
        default:
            fatalError("Unexpected Segue Identifier; \(String(describing: segue.identifier))")
        }
    }

    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            meals.remove(at: indexPath.row)
            saveMeals()
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }

    private func saveMeals() {
        FileStorage.store(at: Meal.archiveUrl, value: meals)

        print("url: \(Meal.archiveUrl)")
        logger.debug("Meals successfully saved")
    }

    private func loadMeals() -> [Meal]? {
        return FileStorage.retrive(at: Meal.archiveUrl)
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
        let meal = meals[indexPath.row]

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "MealViewController") as! MealViewController
        vc.meal = meal

        vc.preferredContentSize = CGSize(width: 0.0, height: UIScreen.main.bounds.size.height)

        previewingContext.sourceRect = view.convert(cell.frame, from: tableView)
        return vc
    }

    func previewingContext(_ previewingContext: UIViewControllerPreviewing, commit viewControllerToCommit: UIViewController) {
        show(viewControllerToCommit, sender: self)
    }

}
