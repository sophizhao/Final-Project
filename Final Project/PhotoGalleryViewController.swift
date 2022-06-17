//
//  PhotoGalleryViewController.swift
//  Final Project
//
//  Created by Aesha Patel on 2022-06-15.
//

import UIKit

class PhotoGalleryViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    var newDate = ""
    var today = ""
    var holdImgs : [String: UIImage] = [:]
    
    var imagePicker = UIImagePickerController()
    
    
    @IBOutlet weak var imageDisplay: UIImageView!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBAction func datePickerChanged(_ sender: Any) {
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateStyle = DateFormatter.Style.short
        dateFormatter.timeStyle = DateFormatter.Style.short

        var strDate = dateFormatter.string(from: datePicker.date)
        let endOfDate = strDate.lastIndex(of: ",")
        strDate = String(strDate[...(endOfDate)!])
        newDate = strDate
        
        showImageByDate(date: newDate)
        
        print(newDate)
        
    }

    
    
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
    
    /*
     Displays image on the page, assigns the date of it to today
     */
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {

        if let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            imageDisplay.image = selectedImage
            imagePicker.dismiss(animated: true, completion: nil)
        }
        holdImgs[today] = imageDisplay.image!
        print(holdImgs)
        print(type(of: imageDisplay.image))

    }
    
    /*
     Pick a date and show an image
     */
    func showImageByDate(date: String){
        
        imageDisplay.image = holdImgs[date]
        
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // let us know if there is any info and report back to the class
        imagePicker.delegate = self
        // Do any additional setup after loading the view.

        let todayDate = Date()

        let dateFormatter = DateFormatter()

        dateFormatter.dateStyle = DateFormatter.Style.short
        dateFormatter.timeStyle = DateFormatter.Style.short

        var strToday = dateFormatter.string(from: todayDate)
        let endOfDate = strToday.lastIndex(of: ",")
        strToday = String(strToday[...(endOfDate)!])
        today = strToday
        print("TODAY:\(today)")
        print(holdImgs)
    }
    

}
