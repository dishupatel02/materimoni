//
//  SearchViewController.swift
//  Metrimony
//
//  Created by disha patel on 23/11/22.
//

import UIKit

protocol chagearray{
    func changearrayvalue(value:[Profile],Screen:String)
}

class SearchViewController: UIViewController , UIPickerViewDelegate,UIPickerViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        <#code#>
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        <#code#>
//    }
//
    
    var slecetchangevalue : chagearray?
    
    
    @IBOutlet weak var GenderSegmentOutlet: UISegmentedControl!
    
    @IBOutlet weak var CastOutlet: UITextField!
    
    @IBOutlet weak var AgeGroup1: UITextField!
    
    @IBOutlet weak var AgeGroup2: UITextField!
    
    
    
    var SelectGender:String = "All"
    var Castes:[Caste] = []
    var selectedCaste:String = ""
    var Castpiker: UIPickerView = UIPickerView()
    var usersArrayOfSearch:[Profile] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        Castpiker.delegate = self
        Castpiker.dataSource = self
        
        
        CastOutlet.inputView = Castpiker
        Castes = CasteDAL.getUser()


    }
    override func viewWillDisappear(_ animated: Bool) {
        let tabbar = tabBarController as! TabViewController
       
        
    }
    
    @IBAction func SearchBtnAction(_ sender: Any) {
        
        usersArrayOfSearch = ProfileDAL.Search(Gender: SelectGender, Caste: selectedCaste, Age1: Int(AgeGroup1.text ?? "") ?? 0, Age2: Int(AgeGroup2.text ?? "") ?? 0)       
        
        search_array=usersArrayOfSearch;
        search_btn="search"
        self.slecetchangevalue?.changearrayvalue(value: usersArrayOfSearch,Screen: "Search")
        
        let indexDeta: [String : Int] = ["index" : 0]
        NotificationCenter.default.post(name: Notification.Name("changeIndex"),object: nil,userInfo: indexDeta)
        self.view.endEditing(true)
        
        
    }
    
    @objc(numberOfComponentsInPickerView:) func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    @objc func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return Castes.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let c:Caste = Castes[row]
                
        return c.CasteName
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let c:Caste = Castes[row]
        CastOutlet.text = c.CasteName
        selectedCaste = c.CasteName
        CastOutlet.resignFirstResponder()
    }
    




}
