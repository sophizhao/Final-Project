//
//  SymptomsLogViewController.swift
//  Final Project
//
//  Created by Aesha Patel on 2022-06-15.
//

import UIKit

class SymptomsLogViewController: UIViewController {

    @IBOutlet weak var newSymptomButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    var loaded = false
    static var symptomName = ""
    var symptoms : [SymptomCD] = []
    static var filteredSymptoms : [SymptomCD] = []
    var today : String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.reloadData()
        
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateStyle = DateFormatter.Style.short
        dateFormatter.timeStyle = DateFormatter.Style.short
        
        dateFormatter.dateFormat = "MM/dd/yy"

        today = dateFormatter.string(from: Date())
        print("Today \(today)")
        print(type(of: today))
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        if !loaded {
            showSymptomByDate(date:today)
        }

        loaded = true
    }


    @IBAction func datePickerChanged(_ sender: Any? = nil) {
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateStyle = DateFormatter.Style.short
        dateFormatter.timeStyle = DateFormatter.Style.short
        
        dateFormatter.dateFormat = "MM/dd/yy"

        var strDate = dateFormatter.string(from: datePicker.date)
        showSymptomByDate(date: strDate)
        print(strDate)
        
    }
    
    func showSymptomByDate(date: String){
        print("1 SSBD called")
        SymptomsLogViewController.filteredSymptoms.removeAll()
        for symptom in symptoms {
            print("2 for loop run")
            if let sympDate = symptom.date{
                print(type(of: sympDate))
                print(sympDate)
                print(today == sympDate)
                if sympDate.contains(date){
                    SymptomsLogViewController.filteredSymptoms.append(symptom)
                    print("Matched")
                }
            }
            
        }
        tableView.reloadData()
        print("Filtered: \(SymptomsLogViewController.filteredSymptoms)")
    }
    
    func getSymptoms(){
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext{
            if let coreDataSymptoms = try? context.fetch(SymptomCD.fetchRequest()) as? [SymptomCD] {

                print("getSymptoms() is run")
                symptoms = coreDataSymptoms
                tableView.reloadData()
            }
        }
    }
    // MARK: - Table view data source

    override func viewWillAppear(_ animated: Bool) {
        getSymptoms()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if let addVC = segue.destination as? AddSymptomViewController {
            addVC.previousVC = self
        }

        if let completeVC = segue.destination as? DeleteSymptomViewController {
            if let symptom = sender as? SymptomCD {
                completeVC.selectedSymptom = symptom
                completeVC.previousVC = self
                print("Testing if prepare is the issue")
            }
        }

    }

}
extension SymptomsLogViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("you tapped me!")
        
        // this gives us a single ToDo
        let symptom = SymptomsLogViewController.filteredSymptoms[indexPath.row]

      performSegue(withIdentifier: "deleteSymptom", sender: symptom)
    }
}

extension SymptomsLogViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SymptomsLogViewController.filteredSymptoms.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifierSymptom", for: indexPath)

        let symptom = SymptomsLogViewController.filteredSymptoms[indexPath.row]
        
        cell.textLabel?.font = UIFont.init(name: "Futura", size: 16)
        
        cell.textLabel?.text = SymptomsLogViewController.filteredSymptoms[indexPath.row].name

        print("Testing cellForRowAt")
        
        return cell
    }

}
