//
//  ViewController.swift
//  Miso.TrackingMealApp
//
//  Created by Hiroka Yago on 2017/12/04.
//  Copyright © 2017 Hiroka Yago. All rights reserved.
//

import UIKit

protocol MealViewControllerDelegate: class {
    func mealViewController(_ viewController: MealViewController, mealDeleteDidTap meal: Meal)
}

class MealViewController: UIViewController, UINavigationControllerDelegate {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var ratingControl: RatingControl!

    public private(set) var meal: Meal?
    private weak var delegate: MealViewControllerDelegate!

    func set(delegate: MealViewControllerDelegate, meal: Meal) {
        self.delegate = delegate
        self.meal = meal
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.delegate = self
        photoImageView.isUserInteractionEnabled = true

        if let meal = meal {
            navigationItem.title = meal.name
            nameTextField.text = meal.name
            photoImageView.image = meal.getPhotoImage()
            ratingControl.rating = meal.rating
        }

        updateSaveButtonState()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func selectImageFromPhotoLibrary(_ sender: UITapGestureRecognizer) {
        nameTextField.resignFirstResponder()

        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)

        guard let button = sender as? UIBarButtonItem,
            button === saveButton else {
            logger.debug("The save button wat not pressed, cancelling")
                return
        }

        let name = nameTextField.text ?? ""
        let photo = photoImageView.image
        let rating = ratingControl.rating

        meal = Meal(name: name, photo: photo, rating: rating)
    }

    @IBAction func cancel(_ sender: UIBarButtonItem) {
        let isPresentingInAddMealMode = presentingViewController is UINavigationController
        if isPresentingInAddMealMode {
            dismiss(animated: true, completion: nil)
        } else if let owningNavigationController = navigationController {
            owningNavigationController.popViewController(animated: true)
        } else {
            logger.error("The MealViewController is not inside a navigation controller.")
        }
    }

    override var previewActionItems: [UIPreviewActionItem] {

        let deleteAction = UIPreviewAction(title: "Delete", style: .destructive) { (action, previewViewController ) in
            guard let meal = self.meal else {
                logger.error("no found meal for delete action. invalid operation.")
                return
            }

            self.delegate.mealViewController(self, mealDeleteDidTap: meal)
        }

        return [deleteAction]
    }
}

extension MealViewController: UITextFieldDelegate {

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        updateSaveButtonState()
        navigationItem.title = textField.text
    }

    func textFieldDidBeginEditing(_ textField: UITextField) {
        saveButton.isEnabled = false
    }

    private func updateSaveButtonState() {
        let text = nameTextField.text ?? ""
        saveButton.isEnabled = !text.isEmpty
    }

}

extension MealViewController: UIImagePickerControllerDelegate {

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String: Any]) {
        guard let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage else {
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }

        photoImageView.image = selectedImage
        dismiss(animated: true, completion: nil)
    }

}
