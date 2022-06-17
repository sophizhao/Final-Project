//
//  AddSymptomViewController.swift
//  Final Project
//
//  Created by Sophia on 6/17/22.
//

import UIKit

class AddSymptomViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!

    var previousVC = SymptomsLogViewController()
    var symptomName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func addTapped(_ sender: Any) {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext{
            
            let symptom = SymptomCD(entity: SymptomCD.entity(), insertInto: context)

            if let text = textField.text{
                symptom.name = text
            }
            
            let todayDate = Date()

            let dateFormatter = DateFormatter()

            dateFormatter.dateStyle = DateFormatter.Style.short
            dateFormatter.timeStyle = DateFormatter.Style.short
            
            dateFormatter.dateFormat = "MM/dd/yy"

            let strToday = dateFormatter.string(from: todayDate)

            symptom.date = strToday
            
            SymptomsLogViewController.filteredSymptoms.append(symptom)
            
            try? context.save()

            navigationController?.popViewController(animated: true)
        }
    }
}


