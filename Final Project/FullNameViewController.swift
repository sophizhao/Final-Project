//
//  FullNameViewController.swift
//  Final Project
//
//  Created by Aesha Patel on 2022-06-15.
//

import UIKit

class FullNameViewController: UIViewController {
    

    
    @IBOutlet weak var textField: UITextField!
    
    static var accountInfo = ["","","","",""]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let checkStr = textField.text{
            FullNameViewController.accountInfo[0] = checkStr
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
