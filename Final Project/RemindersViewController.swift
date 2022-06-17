//
//  RemindersViewController.swift
//  Final Project
//
//  Created by Aesha Patel on 2022-06-15.
//

import UIKit

class RemindersViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var reminders : [ReminderCD] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func getReminders(){
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext{
            if let coreDataReminders = try? context.fetch(ReminderCD.fetchRequest()) as? [ReminderCD] {
                
                print("getReminders() is run")
                reminders = coreDataReminders
                tableView.reloadData()
            }
        }
    }
    

    // MARK: - Table view data source

    override func viewWillAppear(_ animated: Bool) {
        getReminders()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        return reminders.count
    }


    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let dateFormatter = DateFormatter()
//
//        dateFormatter.dateStyle = DateFormatter.Style.short
//        dateFormatter.timeStyle = DateFormatter.Style.short
//
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        
        let reminder = reminders[indexPath.row]
        
//        cell.textLabel?.text =  dateFormatter.string(from: reminder.time ?? Date()) + (reminder.frequency ?? "")!
//        print("Testing cellForRowAt")
//        print(dateFormatter.string(from: reminder.time ?? Date()) + (reminder.frequency ?? "")!)

        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let addVC = segue.destination as? AddReminderViewController {
            addVC.previousVC = self
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

      // this gives us a single ToDo
        let reminder = reminders[indexPath.row]

        performSegue(withIdentifier: "moveToComplete", sender: reminder)
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
