//
//  DeleteSymptomViewController.swift
//  Final Project
//
//  Created by Sophia on 6/17/22.
//

import UIKit

class DeleteSymptomViewController: UIViewController {

    var previousVC = SymptomsLogViewController()
    var selectedSymptom : SymptomCD?
    
    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = SymptomsLogViewController.symptomName

        // Do any additional setup after loading the view.
    }
    
    @IBAction func deleteTapped(_ sender: Any) {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            if let theSymptom = selectedSymptom {
                context.delete(theSymptom)
                let ind  = SymptomsLogViewController.filteredSymptoms.firstIndex(of: theSymptom)!
                SymptomsLogViewController.filteredSymptoms.remove(at: ind)
                try? context.save()
                
                navigationController?.popViewController(animated: true)
            }
        }
    }

}
