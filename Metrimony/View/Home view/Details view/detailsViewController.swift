//
//  detailsViewController.swift
//  Metrimony
//
//  Created by disha patel on 23/11/22.
//

import UIKit

class detailsViewController: UIViewController {
    
    
    @IBOutlet weak var Image: UIImageView!
    
    @IBOutlet weak var Name: UILabel!
    @IBOutlet weak var Gender: UILabel!
    
    @IBOutlet weak var DOB: UILabel!
    @IBOutlet weak var Age: UILabel!
    @IBOutlet weak var Education: UILabel!
    @IBOutlet weak var Height: UILabel!
    @IBOutlet weak var Address: UILabel!
    @IBOutlet weak var City: UILabel!
    @IBOutlet weak var State: UILabel!
    @IBOutlet weak var Phon: UILabel!
    @IBOutlet weak var Mobile: UILabel!
    @IBOutlet weak var Email: UILabel!
    @IBOutlet weak var Remark: UILabel!
    @IBOutlet weak var IsFavourite: UILabel!
    @IBOutlet weak var Caste: UILabel!
    
    var DetailsObj:Profile = Profile()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Image.image = UIImage(named: DetailsObj.Gender == "Male" ? "men" : "women")
        Name.text = DetailsObj.Name
        Gender.text = DetailsObj.Gender
        DOB.text = DetailsObj.DOB
        Age.text = String(DetailsObj.Age)
        Education.text = DetailsObj.Education
        Height.text = DetailsObj.Height
        Address.text = DetailsObj.Address
        City.text = DetailsObj.City
        State.text = DetailsObj.State
        Phon.text = DetailsObj.Phone
        Mobile.text = DetailsObj.Mobile
        Email.text = DetailsObj.Email
        Remark.text = DetailsObj.Remarks
        IsFavourite.text = DetailsObj.IsFavourite  == 0 ? "No" : "Yes"
        
        Caste.text = DetailsObj.CasteName
        
//        IsFavourite.text = DetailsObj.IsFavourite == 0 ? "no" : "yes"
        

    }

    // MARK: - Table view data source
// details view controller is the most joyful disha mansukhbhai aghera
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//        return 0
//    }

    /*x
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
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
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
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
