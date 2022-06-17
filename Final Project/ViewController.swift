//
//  ViewController.swift
//  Final Project
//
//  Created by Sophia on 6/14/22.
//

import UIKit

class ViewController: UIViewController {
    
    

    @IBOutlet weak var quote: UILabel!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var todayLabel: UILabel!
    @IBOutlet weak var fullDateLabel: UILabel!
    
    
    @objc func randomQuoteGenerator() {
        var quotesList = [String]()
        quotesList.append("“Believe you can and you’re halfway there.” ~ Theodore Roosevelt")
        quotesList.append("“Nothing is impossible. The word itself says: ‘I’m possible!'” ~ Audrey Hepburn")
        quotesList.append("“You are never too old to set another goal or to dream a new dream.” ~ C.S. Lewis")
        quotesList.append("“There is no failure except in no longer trying.” ~ Elbert Hubbard")
        quotesList.append("“It Does Not Matter How Slowly You Go As Long As You Do Not Stop.” ~ Confucius")
        quotesList.append("“I’m Not Telling You It Is Going To Be Easy, I’m Telling You It’s Going To Be Worth It.” ~ Arthur L. Williams")
        quotesList.append("“When you feel like quitting think about why you started.” ~ Anonymous")
        quotesList.append("“To accept ourselves as we are means to value our imperfections as much as our perfections.” ~ Sandra Bierig")
        quotesList.append("“Part of courage is simple consistency.” ~ Peggy Noonan")
        quotesList.append("“I have not failed, I have just found 10,000 ways that won’t work.” ~ Thomas Edison")
        quotesList.append("“Every one of us needs to show how much we care for each other and, in the process, care for ourselves.” ~ Princess Diana")
        quote.text = (quotesList[Int.random(in: 0..<11)])
        
    }

    
    
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
        
        let timer : Timer?
        timer = Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(randomQuoteGenerator), userInfo: nil, repeats: true)
        }
        
        // Do any additional setup after loading the view.
    
}

