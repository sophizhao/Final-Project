//
//  ViewController.swift
//  Final Project
//
//  Created by Sophia on 6/14/22.
//

import UIKit

class ViewController: UIViewController {
    
    

    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var todayLabel: UILabel!
    @IBOutlet weak var fullDateLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if FullNameViewController.accountInfo[0] == ""{
            userName.text = "user!"
        } else {
            userName.text = FullNameViewController.accountInfo[0] + "!"
        }
        let f = DateFormatter()

        todayLabel.text = f.weekdaySymbols[Calendar.current.component(.weekday, from: Date()) - 1]
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        
        fullDateLabel.text = dateFormatter.string(from: Date())
        
        // Do any additional setup after loading the view.
    }


}

