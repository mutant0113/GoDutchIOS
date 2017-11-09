//
//  FirstViewController.swift
//  godutch
//
//  Created by 方又生 on 2017/10/17.
//  Copyright © 2017年 方又生. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITextFieldDelegate,
    UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var mLabelMeal: UILabel!
    @IBOutlet weak var mTextFieldMeal: UITextField!
    @IBOutlet weak var mImageViewPhoto: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mTextFieldMeal.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        mTextFieldMeal.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        mLabelMeal.text = mTextFieldMeal.text
    }
    
    
    @IBAction func selectImageFromPhotoLibrary(_ sender: UITapGestureRecognizer) {
        mTextFieldMeal.resignFirstResponder()
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        guard let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage else {
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
        mImageViewPhoto.image = selectedImage
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func setDefaultLabelText(_ sender: UIButton) {
        mLabelMeal.text = "Default Label Name"
    }
    
    @IBAction func textFieldChangeText(_ sender: UITextField) {
        
    }
}

