//
//  Profile.swift
//  Metrimony
//
//  Created by disha patel on 23/11/22.
//

import UIKit

class Profile: NSObject {
    
    var ProfileID:Int32 = Int32()
    var Name:String = String()
    var Gender:String = String()
    var DOB:String = String()
    var Age:Int32 = Int32()
    var CasteId:Int32 = Int32()
    var CasteName:String = String()
    var Education:String = String()
    var Height:String = String()
    var Address:String = String()
    var City:String = String()
    var State:String = String()
    var Phone:String = String()
    var Mobile:String = String()
    var Email:String = String()
    var Remarks:String = String()
    var IsFavourite:Int32 = Int32()
    
}
var search_array:[Profile]=[]
var search_btn:String=""


//let p:Profile = Profile()
//var queary = "insert into Profile(Name,Gender,DOB,Age,CasteId,Education,Height,Address,City,State,Phone,Mobile,Email,Remarks,IsFavourite) values('\(p.Name)','\(p.Gender)','\(p.DOB)','\(p.Age)','\(p.CasteId)','\(p.Education)','\(p.Height)','\(p.Address)','\(p.City)','\(p.State)','\(p.Phone)','\(p.Mobile)','\(p.Email)','\(p.Remarks)',,'\(p.IsFavourite)')"
