//
//  profileViewController.swift
//  Metrimony
//
//  Created by disha patel on 22/11/22.
//

import UIKit

class profileViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{

    

    
    
    
    

    var Profiles:[Profile] = []
    var Screen1:String = ""
    
    
    @IBOutlet weak var TableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        Profiles = ProfileDAL.getProfiles()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        Loaduserdata()
    }
    
    func Loaduserdata(){
//        let tabbar = tabBarController as! TabViewController
//        print("Disha \(tabbar.issearch)")
        TableView.reloadData()
        
        if search_btn == "search"{
           
                Profiles=search_array
                search_btn=""
                search_array=[]
        }
        else{
                    Profiles = ProfileDAL.getProfiles()
        }
    }
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Profiles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : NameTableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! NameTableViewCell
         
        var p:Profile = Profile()
        p = Profiles[indexPath.row]
        
        cell.profilename.text = p.Name
        cell.namelogo.image = UIImage(named: p.Gender == "Male" ? "men":"women" )
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let pdvc : detailsViewController = storyboard?.instantiateViewController(withIdentifier: "detailsViewController_vc") as! detailsViewController
        
        let pa:Profile = Profiles[indexPath.row]
        pdvc.DetailsObj = pa
        
        self.navigationController?.pushViewController(pdvc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        
        let p:Profile = self.Profiles[indexPath.row]
        
        let delet = UITableViewRowAction(style: .default, title: "Delet") { UITableViewRowAction, IndexPath in
            
            
            let alert = UIAlertController(title: "Favourite Car", message: "are you sure to delet \(p.Name)", preferredStyle: .actionSheet)
            
            
            alert.addAction(UIAlertAction(title: "Yes", style: .default , handler: { UIAlertAction in
                
                let status = ProfileDAL.DeletUser(p: p)
                
                if status{
                    self.Loaduserdata()
                }
                
            }))
            alert.addAction(UIAlertAction(title: "Cancel", style: .default , handler: { UIAlertAction in
                
            }))
            
            self.present(alert, animated: true)
        }
        let edit = UITableViewRowAction(style: .default , title: "Edit") { UITableViewRowAction, IndexPath in
            
            let acvc:AddViewController = self.storyboard?.instantiateViewController(withIdentifier: "AddViewController_vc") as! AddViewController
            
            acvc.uau = p
            acvc.fromscreen = "edit"
            
            self.navigationController?.pushViewController(acvc, animated: true)
                
        }
        edit.backgroundColor = .darkGray
        return [delet,edit]
    }

}
