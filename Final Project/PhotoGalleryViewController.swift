//
//  PhotoGalleryViewController.swift
//  Final Project
//
//  Created by Aesha Patel on 2022-06-15.
//

import UIKit

class PhotoGalleryViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    
    var imagePicker = UIImagePickerController()

    
    @IBOutlet weak var imageDisplay: UIImageView!
    
    
    // take a selfie button
    @IBAction func camera(_ sender: Any) {
        // simulator does not have camera so will show error
        imagePicker.sourceType = .camera
        
        present(imagePicker, animated: true, completion: nil)
    }
    
    
    // choose from library button
    @IBAction func photos(_ sender: Any) {
        
        // open the photo library and select a photo
        imagePicker.sourceType = .photoLibrary
        
        present(imagePicker, animated: true, completion: nil)
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            imageDisplay.image = selectedImage
            imagePicker.dismiss(animated: true, completion: nil)
        }
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // let us know if there is any info and report back to the class
        imagePicker.delegate = self
        // Do any additional setup after loading the view.
    }
    

}
