//
//  RemindersViewController.swift
//  Final Project
//
//  Created by Aesha Patel on 2022-06-15.
//

import UIKit

class RemindersViewController: UIViewController {

    @IBOutlet weak var newReminderButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    static var reminderName = ""
    var reminders : [ReminderCD] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self

        
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

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if let addVC = segue.destination as? AddReminderViewController {
            addVC.previousVC = self
        }
        
        if let completeVC = segue.destination as? CompleteReminderViewController {
            if let reminder = sender as? ReminderCD {
                completeVC.selectedReminder = reminder
                completeVC.previousVC = self
                print("Testing if prepare is the issue")
            }
        }

    }

}
extension RemindersViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("you tapped me!")
        
        // this gives us a single ToDo
      let reminder = reminders[indexPath.row]

      performSegue(withIdentifier: "delete", sender: reminder)
    }
}

extension RemindersViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reminders.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        
        let dateFormatter = DateFormatter()

        let reminder = reminders[indexPath.row]
        
        let hour = Calendar.current.component(.hour, from: reminder.time!)
        let minute = Calendar.current.component(.minute, from: reminder.time!)
        
        dateFormatter.dateFormat = "h:mm a"
        let reminderDate = dateFormatter.string(from: reminder.time!)
        RemindersViewController.reminderName = "\(reminderDate) \(reminder.frequency ?? "")"
        
        cell.textLabel?.font = UIFont.init(name: "Futura", size: 16)
        
        cell.textLabel?.text = RemindersViewController.reminderName
        print("Testing cellForRowAt")
        print("\(hour):\(minute) \(reminder.frequency ?? "")")
        
        return cell
    }

}
//
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//
//        return reminders.count
//    }
//
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
////        let dateFormatter = DateFormatter()
////
////        dateFormatter.dateStyle = DateFormatter.Style.short
////        dateFormatter.timeStyle = DateFormatter.Style.short
////
//        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
//
//        let reminder = reminders[indexPath.row]
//
////        cell.textLabel?.text =  dateFormatter.string(from: reminder.time ?? Date()) + (reminder.frequency ?? "")!
////        print("Testing cellForRowAt")
////        print(dateFormatter.string(from: reminder.time ?? Date()) + (reminder.frequency ?? "")!)
//
//        return cell
//    }
//

