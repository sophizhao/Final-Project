//
//  AddReminderViewController.swift
//  Final Project
//
//  Created by Sophia on 6/16/22.
//

import UIKit

class AddReminderViewController: UIViewController {

    var previousVC = RemindersViewController()
    var frequency = ""
    var time : Date = Date()
    
    @IBOutlet weak var timePicker: UIDatePicker!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    @IBAction func frequencyPicked(_ sender: UISegmentedControl) {
        switch segmentedControl.selectedSegmentIndex {
            case 0:
                frequency = "daily"
            case 1:
                frequency = "weekly"
        default:
            break
        }
    }
    
    @IBAction func timePicked(_ sender: Any) {
        time = timePicker.date
        print(time)
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func addTapped(_ sender: Any) {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext{
            
            let reminder = ReminderCD(entity: ReminderCD.entity(), insertInto: context)

            reminder.frequency = frequency

            reminder.time = time


            try? context.save()

            navigationController?.popViewController(animated: true)
        }
    }



    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


}
