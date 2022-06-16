//
//  MyAccountViewController.swift
//  Final Project
//
//  Created by Aesha Patel on 2022-06-15.
//

import UIKit

class MyAccountViewController: UIViewController {
    
    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var medicationLabel: UILabel!
    @IBOutlet weak var dosageLabel: UILabel!
    @IBOutlet weak var periodLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        fullNameLabel.text = FullNameViewController.accountInfo[0]
        ageLabel.text = FullNameViewController.accountInfo[1]
        medicationLabel.text = FullNameViewController.accountInfo[2]
        dosageLabel.text = FullNameViewController.accountInfo[3]
        periodLabel.text = FullNameViewController.accountInfo[4]
        
        

        // Do any additional setup after loading the view.
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
