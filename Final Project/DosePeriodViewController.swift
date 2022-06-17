//
//  DosePeriodViewController.swift
//  Final Project
//
//  Created by Aesha Patel on 2022-06-15.
//

import UIKit

class DosePeriodViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    var number = ""
    var period = ""
    
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var myPicker: UIPickerView!
    
    let pickerData = [
        ["0","1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31","32","33","34","35","36","37","38","39","40","41","42","43","44","45","46","47","48","49","50","51","52","53","54"],
        ["None","day(s)","weeks","months","years"]
    ]
    
    let dayComponent = 0
    let periodComponent = 1

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.myPicker.delegate = self
        self.myPicker.dataSource = self
    
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
    
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        

        return pickerData[component].count
    }
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int,forComponent component: Int) -> String? {
        

        pickerView.setValue(UIColor.white, forKeyPath: "textColor")
 
        return pickerData[component][row]

    }
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {

        updateLabel()
    }

    
    
    func updateLabel() {
        number = pickerData[dayComponent][myPicker.selectedRow(inComponent: dayComponent)]
        period = pickerData[periodComponent][myPicker.selectedRow(inComponent: periodComponent)]
        label.text = number + " " + period
        print("5")

        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print(FullNameViewController.accountInfo)
        let addStr : String = number + " " + period
        FullNameViewController.accountInfo[4] = addStr
    }
    
    
}


