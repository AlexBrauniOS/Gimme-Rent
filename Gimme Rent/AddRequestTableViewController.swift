//
//  AddRequestTableViewController.swift
//  Gimme Rent
//
//  Created by Oleksiy Lubarets on 22.05.17.
//  Copyright © 2017 Alex Braun. All rights reserved.
//

import UIKit
import Parse

protocol SaveDelegat {
    func saveRequest(_ request: NewRequest)
    
}

class AddRequestTableViewController: UITableViewController, UINavigationControllerDelegate {

    @IBOutlet weak var CitySelectLabel: UILabel!
    @IBOutlet weak var PeriodFromSelect: UILabel!
    @IBOutlet weak var PeriodFromDataPicker: UIDatePicker!
    @IBOutlet weak var PeriodToSelect: UILabel!
    @IBOutlet weak var PeriodToDataPicker: UIDatePicker!
    @IBOutlet weak var PeopleSelect: UILabel!
    @IBOutlet weak var DetailsOfRequestTextView: UITextView!
    @IBOutlet weak var CostLabel: UILabel!
    
    
    var delegate: SaveDelegat?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 8
    }

    @IBAction func SaveRequestButton(_ sender: Any) {
        
        let city = CitySelectLabel.text
        let periodFrom = PeriodFromSelect.text
        let periodTo = PeriodToSelect.text
        let people = Int(PeopleSelect.text!)
        let cost = Int(CostLabel.text!)
        let detailsOfRequest = DetailsOfRequestTextView.text
        
        let newRequest = NewRequest(city: city!, periodFrom: periodFrom!, periodTo: periodTo!, people: people!, cost: cost!, detailsOfRequest: detailsOfRequest!)
        
        delegate?.saveRequest(newRequest)
        _ = self.navigationController?.popViewController(animated: true)
        
    }
    
    let gregorian: NSCalendar = NSCalendar(calendarIdentifier: NSCalendar.Identifier.gregorian)!
    let currentDate: NSDate = NSDate()
    let components: NSDateComponents = NSDateComponents()
    
    @IBAction func PeriodFromDataPickerAction(_ sender: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy HH:mm"
        let strDateFrom = dateFormatter.string(from: PeriodFromDataPicker.date)
        self.PeriodFromSelect.text = strDateFrom
        
        components.day = 0
        let minDate: NSDate = gregorian.date(byAdding: components as DateComponents, to: currentDate as Date, options: NSCalendar.Options(rawValue: 0))! as NSDate
        
        self.PeriodFromDataPicker.minimumDate = minDate as Date
        
    }
    
    @IBAction func PeriodToDataPickerAction(_ sender: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy HH:mm"
        let strDateTo = dateFormatter.string(from: PeriodToDataPicker.date)
        self.PeriodToSelect.text = strDateTo
        
        components.day = 1
        let minDate: NSDate = gregorian.date(byAdding: components as DateComponents, to: currentDate as Date, options: NSCalendar.Options(rawValue: 0))! as NSDate
        
        self.PeriodToDataPicker.minimumDate = minDate as Date
    }
    
    @IBAction func PeopleStepper(_ sender: UIStepper) {
        PeopleSelect.text = String(Int(sender.value))
    }
    
    @IBAction func CostSlider(_ sender: UISlider) {
        CostLabel.text = String(Int(sender.value))
    }
    
    
    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
