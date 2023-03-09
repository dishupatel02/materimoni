//
//  LikeViewController.swift
//  Metrimony
//
//  Created by disha patel on 23/11/22.
//

import UIKit

class LikeViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    var FavouriteusersArray:[Profile] = []

    @IBOutlet weak var TableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
        
    
        
        
        
        
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        FavouriteusersArray = ProfileDAL.getFavouriteUser()
        TableView.reloadData()
        print("utsav \(FavouriteusersArray.count)")
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return FavouriteusersArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: LikeTableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! LikeTableViewCell
        
        
        let p:Profile = FavouriteusersArray[indexPath.row]
        
        
        cell.Profileimage.image = UIImage(named: p.Gender == "Male" ? "men":"women")
        
        cell.Profilename.text = p.Name
        cell.Profileeducation.text = p.Education
        cell.Profiledob.text = String(p.DOB)
        
        return cell
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let pdvc:detailsViewController = storyboard?.instantiateViewController(withIdentifier: "detailsViewController_vc") as! detailsViewController
        
        let p:Profile = FavouriteusersArray[indexPath.row]
        pdvc.DetailsObj = p
        
        self.navigationController?.pushViewController(pdvc, animated: true)
    }

        // Do any additional setup after loading the view.
    
    


}
