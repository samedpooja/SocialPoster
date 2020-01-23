//
//  ViewController.swift
//  SocialPoster
//
//  Created by Pooja on 23/00/2020.
//  Copyright © 2020 Tagrem. All rights reserved.
//

import UIKit
import Social

class ViewController: UIViewController , UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var Textfield: UITextField!
    @IBOutlet weak var Imageview: UIImageView!
    @IBOutlet weak var backArrow: UIImageView!
     let imagePicker = UIImagePickerController()

    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
        ///******Change Back Button Color******
        backArrow.image = backArrow.image?.withRenderingMode(.alwaysTemplate)
               backArrow.tintColor = UIColor.white

    }

    @IBAction func Image(sender: AnyObject) {
        let alert:UIAlertController = UIAlertController(title: "Choose Image", message: nil, preferredStyle: UIAlertController.Style.actionSheet)
        
    let gallery = UIAlertAction(title: "Open Gallery", style: UIAlertAction.Style.default)
                {
                    UIAlertAction in
                    self.openGallary()
                }
        let cameraAction = UIAlertAction(title: "Camera", style: UIAlertAction.Style.default)
                {
                    UIAlertAction in
                    self.openCamera()
                }
                let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel)
                {
                    UIAlertAction in
                    self.imagePicker.dismiss(animated: true, completion: nil)
                }
                alert.addAction(gallery)
                alert.addAction(cameraAction)
                alert.addAction(cancelAction)
                
                present(alert, animated: true, completion: nil)
            }
    

          ///******Shareing the Post******
    @IBAction func Facebook(sender: AnyObject) {
        let activityController = UIActivityViewController(activityItems: [Textfield.text!, #imageLiteral(resourceName: "Background")],
                                                                 applicationActivities: nil)
               present(activityController, animated: true, completion: nil)
    }
    
             
     func openCamera() {
    if(UIImagePickerController .isSourceTypeAvailable(UIImagePickerController.SourceType.camera))
    {
        imagePicker.sourceType = UIImagePickerController.SourceType.camera
        self.present(imagePicker, animated: true, completion: nil)
    }

            }
    
    func camera()
    {
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            let myPickerController = UIImagePickerController()
            imagePicker.delegate = self;
            imagePicker.sourceType = .camera
            self.present(imagePicker, animated: true, completion: nil)
        }
        
    }
    
    func openGallary()
    {
        imagePicker.sourceType = UIImagePickerController.SourceType.photoLibrary
        self.present(imagePicker, animated: true, completion: nil)
    }
    

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController)
    {
        picker.dismiss(animated: true, completion: nil)
    }
    

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
        Imageview.contentMode = .scaleAspectFit
         Imageview.image = pickedImage
          }
        
        dismiss(animated: true, completion: nil)
    }
    @IBAction func backBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
 
}

