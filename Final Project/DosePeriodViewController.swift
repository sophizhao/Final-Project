//
//  DosePeriodViewController.swift
//  Final Project
//
//  Created by Aesha Patel on 2022-06-15.
//

import UIKit

class DosePeriodViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    


    
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var myPicker: UIPickerView!
    
    let pickerData = [
        ["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31","32","33","34","35","36","37","38","39","40","41","42","43","44","45","46","47","48","49","50","51","52","53","54"],
        ["days","weeks","months","years"]
    ]
    
    let dayComponent = 0
    let periodComponent = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myPicker.delegate = self
        myPicker.dataSource = self
        print("1")
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
    
        return pickerData.count
    }
    
    func pickerView(_pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        print("2")
        return pickerData[component].count
    }
    
    
    func pickerView(_pickerView: UIPickerView, titleForRow row: Int,forComponent component: Int) -> String? {
        
        print("3")
        return pickerData[component][row]
    }
    
    
    func pickerView(_pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        print("4")
        updateLabel()
    }
    
    
    func updateLabel() {
        let number = pickerData[dayComponent][myPicker.selectedRow(inComponent: dayComponent)]
        let period = pickerData[periodComponent][myPicker.selectedRow(inComponent: periodComponent)]
        label.text = number + " " + period
        print("5")

        
    }
    
    
}


