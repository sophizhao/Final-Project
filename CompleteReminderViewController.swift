//
//  CompleteReminderViewController.swift
//  Final Project
//
//  Created by Sophia on 6/16/22.
//

import UIKit

class CompleteReminderViewController: UIViewController {
    
    var previousVC = RemindersViewController()
    var selectedReminder : ReminderCD?
    
    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = RemindersViewController.reminderName

        // Do any additional setup after loading the view.
    }
    
    @IBAction func deleteTapped(_ sender: Any) {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            if let theReminder = selectedReminder {
                context.delete(theReminder)
                try? context.save()
                
                navigationController?.popViewController(animated: true)
            }
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
