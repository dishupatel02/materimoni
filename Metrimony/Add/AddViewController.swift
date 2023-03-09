//
//  AddViewController.swift
//  Metrimony
//
//  Created by disha patel on 24/11/22.
//

import UIKit

class cellclass:UITableViewCell{
    
}

class AddViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIPickerViewDelegate, UIPickerViewDataSource {

    
    
    var flag = true

    var favourite:Int32 = 0
    @IBOutlet weak var FavouriteSegmentOutlets: UISegmentedControl!
    
    @IBAction func FavouriteSegmentAction(_ sender: Any) {
        
        switch FavouriteSegmentOutlets.selectedSegmentIndex
        {
        case 0:
            favourite = 1
            
        case 1:
            favourite = 0
           
            
        default:
            favourite = 0
        }
       
    }
    

    
    
    @IBOutlet weak var MainImage: UIImageView!
   
    
    @IBOutlet weak var Name: UITextField!
    @IBOutlet weak var Age: UITextField!
    
    
    
    @IBOutlet weak var Date: UIDatePicker!
    @IBOutlet weak var gender: UITextField!
    
    @IBOutlet weak var Education: UITextField!
    
    @IBOutlet weak var Height: UITextField!
    
    @IBOutlet weak var Address: UITextField!
    
    @IBOutlet weak var CastTextfiled: UITextField!
    
    @IBOutlet weak var State: UITextField!
    @IBOutlet weak var City: UITextField!
    
    @IBOutlet weak var Phone: UITextField!
    
    @IBOutlet weak var Mobile: UITextField!
    
    @IBOutlet weak var Remarks: UITextField!
    @IBOutlet weak var Email: UITextField!
    
    @IBOutlet weak var submitButtonOutlet: UIButton!
    
    var Castpiker: UIPickerView = UIPickerView()
    var DOBPiker: UIDatePicker = UIDatePicker()
    
    let transparentView = UIView()
    let tableView = UITableView()
    var selectedButton = UIButton()
    var dataSource = [String]()
    var Castes:[Caste] = []
    var selectedCaste:Caste = Caste()
    var uau:Profile = Profile()
    var fromscreen = ""
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        super.viewDidLoad()
        MainImage.layer.masksToBounds = true
        MainImage.layer.cornerRadius = MainImage.bounds.width/2
        FavouriteSegmentOutlets.selectedSegmentIndex = 1
      
//
        tableView.delegate = self
        tableView.dataSource = self
        Castpiker.delegate = self
        Castpiker.dataSource = self
        tableView.register(cellclass.self, forCellReuseIdentifier: "cell")
        
        CastTextfiled.inputView = Castpiker
        Castes = CasteDAL.getUser()
                 
        if fromscreen == "edit"{
            self.title = uau.Name
            Name.text = uau.Name
            MainImage.image = UIImage(named: uau.Gender == "Male" ? "men":"women")
            

//            btnSelectGender.setTitle(uau.Gender, for: .normal)
            if uau.IsFavourite == 1{
//                StarBtn.image = UIImage(systemName: "star.fill" )
                FavouriteSegmentOutlets.selectedSegmentIndex = 0
            }
            else{
//                StarBtn.image = UIImage(systemName: "star" )
                FavouriteSegmentOutlets.selectedSegmentIndex = 1
            }
            
            
            print(uau.DOB)
            print(type(of: uau.DOB))
            
            let df = DateFormatter()
            df.dateFormat = "dd-MM-yyyy"
            let date = df.date(from: uau.DOB)
            let fixdate = df.date(from: "02-04-2003")
            Date.setDate((date ?? fixdate)!, animated: true)
            
            Age.text = String(uau.Age)
            
            
            Castpiker.selectRow(Int(uau.CasteId)-1, inComponent: 0, animated: true)
            CastTextfiled.text = uau.CasteName
            selectedCaste.CasteId=uau.CasteId;
            
            Education.text = uau.Education
            
            Height.text = uau.Height
            gender.text = uau.Gender
            
            
        
            
            
            Address.text = uau.Address
            
            City.text = uau.City
            
            State.text = uau.State
            
            Phone.text = uau.Phone
            
            Mobile.text = uau.Mobile
            
            Email.text = uau.Email
            CastTextfiled.text = uau.CasteName
            
            Remarks.text = uau.Remarks
            
            //isfavourite
            
            
            submitButtonOutlet.setTitle("Update", for: .normal)
        }

        
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return Castes.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let c:Caste = Castes[row]
        
        return c.CasteName
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let c:Caste = Castes[row]
        CastTextfiled.text = c.CasteName
        selectedCaste = c
        CastTextfiled.resignFirstResponder()
    }
    
    
    
    func addTransparentView(frames: CGRect) {
             let window = UIApplication.shared.keyWindow
             transparentView.frame = window?.frame ?? self.view.frame
             self.view.addSubview(transparentView)
             
             tableView.frame = CGRect(x: frames.origin.x, y: frames.origin.y + frames.height, width: frames.width, height: 0)
             self.view.addSubview(tableView)
             tableView.layer.cornerRadius = 5
             
             transparentView.backgroundColor = UIColor.black.withAlphaComponent(0.9)
             tableView.reloadData()
             let tapgesture = UITapGestureRecognizer(target: self, action: #selector(removeTransparentView))
             transparentView.addGestureRecognizer(tapgesture)
             transparentView.alpha = 0
             UIView.animate(withDuration: 0.4, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: .curveEaseInOut, animations: {
                 self.transparentView.alpha = 0.5
                 self.tableView.frame = CGRect(x: frames.origin.x, y: frames.origin.y + frames.height + 5, width: frames.width, height: CGFloat(self.dataSource.count * 50))
             }, completion: nil)
         }
    
    @objc func removeTransparentView() {
             let frames = selectedButton.frame
             UIView.animate(withDuration: 0.4, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: .curveEaseInOut, animations: {
                 self.transparentView.alpha = 0
                 self.tableView.frame = CGRect(x: frames.origin.x, y: frames.origin.y + frames.height, width: frames.width, height: 0)
             }, completion: nil)
         }
    
    @IBOutlet weak var btnSelectGender: UIButton!
    
    
    
    
    @IBAction func SelecGenderDrop(_ sender: Any) {
        dataSource = ["Male", "Female"]
            selectedButton = btnSelectGender
            addTransparentView(frames: btnSelectGender.frame)
    }
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataSource.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = dataSource[indexPath.row]
        
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
             selectedButton.setTitle(dataSource[indexPath.row], for: .normal)
        
//            gender = selectedButton.title(for: .normal) ?? ""
        
//        if gender == "Male"{
//            MainImage.image = UIImage(named: "men")
//        }
//        else{
//            MainImage.image = UIImage(named: "women")
//        }
//
//             removeTransparentView()
         }
    
    
    @IBAction func Submit(_ sender: Any) {
        var submitObj:Profile = Profile()
        
        submitObj.Name = Name.text ?? ""
        submitObj.Gender = gender.text ?? ""
    
        let selectdate = DOBPiker.date
        
        
        
        
        let formate = DateFormatter()
        formate.dateFormat = "dd-mm-yy"
        submitObj.DOB = formate.string(from: selectdate)
        
        submitObj.Age = Int32(Age.text ?? "0") ?? 0
        
        submitObj.CasteId = selectedCaste.CasteId
        submitObj.Gender = gender.text!
        MainImage.image = UIImage(named:  submitObj.Gender == "Male" ? "men":"women")
        submitObj.Education = Education.text!
        
        submitObj.Height = Height.text!
        
        submitObj.Address = Address.text!
        
        submitObj.City = City.text!
        
        submitObj.State = State.text!
        
        submitObj.Phone = Phone.text!
        
        submitObj.Mobile = Mobile.text!
        
        submitObj.Remarks = Remarks.text!
        
        submitObj.IsFavourite = favourite
        
       
       
        
        var status:Bool = false
        
        if fromscreen == "edit"{
            
            submitObj.ProfileID = uau.ProfileID
            status = ProfileDAL.EditUser(us: submitObj)
            
        }
        else{
            
            status = ProfileDAL.AddUser(us: submitObj)
        }
        
        if status{
            let alert = UIAlertController(title: "add", message: fromscreen == "edit" ? "you just upadate \(submitObj.Name)" :"you just add new user successfully ", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "ok", style: .default,handler: {UIAlertAction in
                
                self.navigationController?.popViewController(animated: true)
                
            }))
            self.present(alert, animated: true)
        }
        
        
        
        

        let indexDeta: [String : Int] = ["index" : 0]
        NotificationCenter.default.post(name: Notification.Name("changeIndex"),object: nil,userInfo: indexDeta)
        self.view.endEditing(true)
        
        
            
        
        
        
        
        
    }
    

 
}
